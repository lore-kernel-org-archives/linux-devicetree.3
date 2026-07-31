Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7493B1EC8
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 14:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508123; cv=none; b=GJXLnYwHLIFgrf1XtUxhMHiLAHarTE2Re50wCQUXANQSeH8CJuRiMOldUd2Xiux2SRITjIndyqxzpyMuF/5q2ktOZx7BMDKefcpN5EInaAZmSabpfnBkXMHfgfOpa4hdUf/50l5My8sEqxJq24aFqwgWjUuuSTEUgwcqXlk6E0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508123; c=relaxed/simple;
	bh=bJIYJvKsMNEruxpzrlHOJljkrhHcajYooGadT96u0HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYoYsQGHy6VyNfq3QEHXZF1hTliLqcxTVtkEP/yGuUrjLu9pBPaqoXw25JGFC92d1aHCjY98hLs2bopmm7iHppTl20OLFo75EoN6NnZZf4agWbTEz1ElTNBFL3tKY+09Usq+sEgsgCuydsyEqyuNhAn+pV8qeHLXj5MyogTu5ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbCvswdp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbCvswdp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfff5f88dbso10876985ad.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508120; x=1786112920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TKJ9iDE/Xqq1g7NWZ7YBtTJP0oKWB5LTOhWSNxoPZsk=;
        b=nbCvswdpTyJKEWkYJFQ5jjfIeBPVCYlw8mSUayTHqnkBhdn7p0jDhydVeNkiOF13jS
         55ZUJAAAU1AvbhwPohXnxu+kQ5saUb9qS2aKbqJ+2hjEUVAsJ6rI8X3/BmBO9Q5XevSI
         /eKwW8/cUyn09LixK0BYo88+GbOY0gT4/wW7S+I60S1pdlekwF0mrGoN2kuF2NTtRl1x
         OFwcr2hC2zZ2I+WJ8Df+mg+/iM2x0GN58/tJ2aaC0QdIKCEJI/k1EFIQhRYnH7JsfbCK
         m9L9PnoUGpU4vCHUjgkv9xMyAKhEm2KKLpYvajFNNesVMUbyqUayQs+LsHyphvaNcFXN
         36QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508120; x=1786112920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TKJ9iDE/Xqq1g7NWZ7YBtTJP0oKWB5LTOhWSNxoPZsk=;
        b=M6by1mzZZYbxr3PCGl550EqUF0f92S/QBZf066qoOso8PfQtU1Tefi5mzQfSEHzDTW
         DPPp/HgKJnGNJUHJycEYKSQrIqEod995kIL0NF2vzdGKxnmuhtxVEPX3MU+FeWj4R62q
         44ljLwOQT01dNnH8Fb0P0jZPqaJBJe2G8GnFP6VC1V5I1JxefSZzByzz8YNDeTvIZ+n0
         /bhRF8mDIsBZNK9xnZOXMDj+SP8aec3NAov6FvqYpydOYc0zhNVVvNYMgqR5YoOsdp2R
         umCHrHZaRTPKgxAmeObaVAyXDVyctAa2i7trMRYrnRZkqgnY/icl1N1emRoyAi0ONzDd
         wlzg==
X-Forwarded-Encrypted: i=1; AHgh+Rr6r3mFYbcJa2IJO0TI7MyhpKXA2BAvw/g4PdlouMCK6Qw5HPS1VFZggsAxqd3jfFEfy1eqijejzq/T@vger.kernel.org
X-Gm-Message-State: AOJu0YzQfX/AyO8tfFqmAoZ9BkLmxhuYLSE6BiUdt1lBS/GwB96cj9Ju
	F0XE5oGcx+5PVjMCpYzWMqBa9daTWHNi70IcIQYpKorENwiXEfCdrxyK
X-Gm-Gg: AR+sD11KN963T+WzU49ubG4YJ3MEr1q4+HlC/TwIK18qc0eeLva36Up3rBgjO/nG1X6
	AtUae5kD2nmlOFnuYaSG2rcxDxg/l0ijU8F8AHp6SOWWaDkMLpPXUi776qSWzVybgFJfU/dYRbd
	Ks/mnu8pfuMM3NVnO2+wfIpgMofEbx2fpqTpr0lF7FzR+zfnluKpTud4C5AFoSAaq+5KXvhglef
	85sIRG6l5qglrRCFixCMan+G+NI6DhcAQwBhwDmt7PlCdaXH/r5Mxj+t3+7H/U3qrdlrs8Ut6Xg
	2AsxhkjlgnZr03ZNIgGDjYTqRhOPJos7eM+qtXTiubDrY2YP0uVIanSbV6l1JkNoDnaDdlf1quV
	Hbl0gT6yQuC4kxqe1UDXPlXGhObetaKhsMZV9u7ZsTH3b4/q6hclht6XdWP4X/mdyBB3vPIckjc
	cOzZ66loB4oC+y1akocmIwDaNdEkVUowOC2KcwwpNHyHkLVzh/n6iX0eXejgqpr0HJYhHDD3vma
	Q==
X-Received: by 2002:a17:902:e849:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0522340damr2268765ad.19.1785508119517;
        Fri, 31 Jul 2026 07:28:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15db1esm5979555ad.81.2026.07.31.07.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
Message-ID: <8ffd1289-c895-4ce5-ab0f-dad1c9696ddd@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-2-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:00PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The MPS MPQ8646 PMBus step-down converter uses the same
> mps,vout-fb-divider-ratio-permille property with the same constraints
> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
> to the existing schema.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
