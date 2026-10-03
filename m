Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731002EBBA1
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791005183; cv=none; b=EQd+QtRHipr1lxMKdzfZ1obxzvN8ZyqY1jxSJPtziSwinJCGarz+SYNJgDU0SUX9mVYpo6E7E8HDXBK+B8X7oF+6TQeytvIBC/eQMjvImUzsz2cfT+Ny0LgVAdfWPhsQS4tO0Y689tszSiQcT6gwtPNdPqgmtf/F8ehPDIzLwxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791005183; c=relaxed/simple;
	bh=op4aSA+XgB5lSJN5ZiyPQbZ2ip5BcNDg23uH3MDzkM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEuLEB6Q1Yj/g47SQHFDB7HYfLAsEbYB2c04zbppkT+LXba3jDfKFFXrIUF6/QaVNmV8wj0ll/q+LxFEJl6OFNKlKGU6eNVXR+fX9FI9AsW2wAz1nhrhNphK6I3Wa4vRD0F8UbTBGy/PMDi+NtGJbwxk+B82YpxlmYLsZ5cAKpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TENbKyXe; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TENbKyXe"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34bffc8105eso49595eec.0
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791005181; x=1791609981; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9JTd/C76t5r8bTsnEDhlS/YkoysQFw3zlanAllm5PQ=;
        b=TENbKyXe66AgtY2RJIL1pU3shCzih+ABgeLh7U+M7dJr64aHd/FHgqJpJ7OQkMXsvW
         GO0TYghimc1e/nKSLJJOn2JD10zfT0JhrjTmc3M9StS/v/nPGXzS0LL2HYumYnbOh+E8
         A7Uy5OueA+W8Xl8k66Cu1RYOThKKPXV6JU5pkrQz3I7Cx52iwPKOZIB6H0Eehbu/f/rC
         FKVeRoj7GpD8NdPnGSAcjvQ3x43WkPCPHn37Wz9sBiV601ivVvDrFqYKz4pKpTUO7c+W
         63Ag4PJVjiIUUJT4hFFXfbiNgaYPwhgXesr9wmCKlgHVhGE6v7zV8m8GcXszkgyCneSH
         LIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791005181; x=1791609981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9JTd/C76t5r8bTsnEDhlS/YkoysQFw3zlanAllm5PQ=;
        b=CBI/YCQIYqqEwAJVUcv3QPbN+H2RZBA7oSlkn8Yl6RV1jY7GfUIUKBHkR7AXolvk/v
         kMxy7KFOloBauB9WEbwqPqfpserwzfjp7wza9nkE+0+3I3t7mKopedZ/RtXSziPi5bmh
         4+yTxABV7E7wxn36OWpgI+ECK8f98xhqKaSYXx9taplMbTWpjExen5XnzzsDxy5xX4qx
         Z3H3cbj65s2EhnksgjHVfFza+TdMw0ehn7al+zuF+hVCqy6WooRB+TAk8aAvDIIukT+Q
         bXmrh544O3TCXA300nmyRyT0xH/0cmlKj0d0AYRnxbprg8FJgyYA3ra1R+vtinUzR1is
         P1hw==
X-Forwarded-Encrypted: i=1; AKwUvBxchH46/LvfziEPZShEKqE1FWfjYqXrNVew5r2Ba5vZ6ux81pZEQR1w9CH1gtYcqY/vQqm0HEeqtEC2@vger.kernel.org
X-Gm-Message-State: AFq9FYKa6E0x5Uw8vMe6pY7pWjIu1OSH0xigz4Xk/jVk4BU8lJex/qbe
	7gvxXRBevYx/hQgv7rJPemJxQbU/eUom0k+I8VG8negSqbH7SZH/GCik
X-Gm-Gg: AYBFou3GpgbffXfwQLNojLNWuJt29aZT+tIwNvzpZj8wYsRRGosq6bJ/WgPqsaD5klC
	5b9WctyaVWm7WkMrCx+FsVn6rQnp/uXPm0MSMMfyYqTQcgI35iPa3ZKpe/WrDejsQ5JblgGWuvc
	2CmeJUanaJE+Fp6I2XDx8z2aQWTOruQXbslv6a2BkAdKpW23JJDLLiMd8W7WoO1WsC2do34fd90
	F35YD9q2oL/snPpikhmGBHvQS+i2pIKsyzyzR1phwldDNEl5XXBcnxrXGCywV1cxexZ3NsB7AkN
	20tWQOQsKdChicDD4qXg17h6/NMRF4CHL9RSoyRacH/Z8hCi+fQ2efetCs8DRZRoELYTqg+IYck
	FqV1Crn0PyeLt1u86zxZfDY3K9GHpWojju5UZUU99R7odt08bxZ9G3IgnVFkcTezB4SouRTnSCZ
	kBNr98g0XSTAcsdOjN7k/O/lTsVaoH6vcQn43ddlDd3u469P92ZbRBRvtSyW5yMd4YPZPTgnpfy
	y1C7eMQ+BFAlTDQE/zjTPD965mGNYFz72VLIE1Y
X-Received: by 2002:a05:693c:88cc:10b0:351:1131:58c with SMTP id 5a478bee46e88-35111310762mr1881138eec.23.1791005181373;
        Fri, 02 Oct 2026 22:26:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f6b0:90e5:8010:fce8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14fd9698sm11542217eec.23.2026.10.02.22.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 22:26:20 -0700 (PDT)
Date: Fri, 2 Oct 2026 22:26:17 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kendall Willis <k-willis@ti.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] Input: gpio-keys - support wakeup pinctrl state
 on suspend
Message-ID: <asCRyl0MeG1AWiZW@google.com>
References: <20261001-upstream-gpio-wakeup-v3-0-6f3bcde367a3@ti.com>
 <20261001-upstream-gpio-wakeup-v3-2-6f3bcde367a3@ti.com>
 <20261001160201.4F53D1F00898@smtp.kernel.org>
 <20261001161231.eopj5fqxfn6d54sz@uda0506412>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001161231.eopj5fqxfn6d54sz@uda0506412>

Hi Kendall,

On Thu, Oct 01, 2026 at 11:12:31AM -0500, Kendall Willis wrote:
> Pinctrl is optional to use for gpio-keys so we only care if
> -EPROBE_DEFER is the error from pinctrl which would mean that it just
> has not been probed yet. All other errors can fall through and the
> pinctrl_wakeup variable would be left as NULL.

If pinctrl is not specified, devm_pinctrl_get() returns -ENODEV (or NULL
if !CONFIG_PINCTRL). Other errors (-ENOMEM, -EINVAL) indicate genuine
issues that should not be swallowed.

Please reset ddata->pinctrl to NULL, ignore -ENODEV, and propagate any
other errors:

	ddata->pinctrl = devm_pinctrl_get(dev);
	if (IS_ERR(ddata->pinctrl)) {
		error = PTR_ERR(ddata->pinctrl);
		ddata->pinctrl = NULL;

		if (error != -ENODEV)
			return dev_err_probe(dev, error,
					     "Failed to get pinctrl\n");
	}

Thanks.

-- 
Dmitry
