Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40949552D
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590110; cv=none; b=DVecHxZeLvtRB+EdViELwGw15X7C4/VsrxiM12Ila8+x2jb8PPLE68v64gy2h/DfyuoAQP1sMtcbU30EmsCnHOG6arUvpezpx9L577FBcxxmB2hhmvZ0GsDRgMMQBq8W7yFPSsJ26DHQxJ41TNedvUMdwwmZCvj5V263kCS09pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590110; c=relaxed/simple;
	bh=XhAixuhqSe/dsQG0NsclCcJxEyaEsGjyMcp/KpLvQIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mgtcnFGphN8+X4zKBQ7mg/6Aa/3woQJJ6XyT9W7sKJvySzTsBWp0WCJmoMS6+7ekDWe+9WRZrgpxJBeou6KPAA37SPlUveUvn7xudn/32M139gzHiBRxh7nX7VIpRC1ti8WtAGnOdFEfUE2zaFUWF9YODOALAA2NHJ7SDxNocgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHFTKaDY; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHFTKaDY"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c264788fd58so405994966b.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790590107; x=1791194907; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=tHFTKaDYcRQQkzhjpAs68UQ1AOyyrNIaSXTFTDm+p6WCmvk+msi+zPE6bAD0aLiAyJ
         ttuGTFUc2QMCdbJekz7zZ7j1m/XFPcLcixjH7UDXCA/v2iWb5+7tJc3yZCOnCzi1MXDA
         +J+aiTpiosBQBpqHs/LYelsau90WY8XuXa3ywHWMgIDA4VC79T478Q79lJjcR7OMaaAE
         EamD2IA9cnnhHtBA6qdMFCmvBNvrzJlb4Dz2DfQoWlxV76H73JWPbRyGbP+t0XlVtVTT
         mQFqNwh7KaLaNZC9rr4KbxycUJIFQlMM6X9E/7F+zrtPJArNO7fiKbmMdxWJrUw4gRSC
         kViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790590107; x=1791194907;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wTVCY6beQgFN5l4WsD2fqNqKkKl80zolb7oRNqVRMfQ=;
        b=xbGIC29dnS7YxinJTazIMoWYgxSVep0sgWDcNDV7HV+32pOK69+gIiC0bCXuQLFjyg
         AMkX46T/DO4PaieDIOvYze5R7x9yaXDzP2RcMYDtD11z9uK8BX2Wb/Fve+t8BdketsLE
         ePi0s+cL3YuOoTx3+/NffkCuhkKgJeqFNWXZBi0hZtsLBNGqO/Svzz2Kkyd5eqUHGxKh
         9qEmsWawAhTwXMnTyOgVnVVU2N0mX0sarJOIZNNpI+WnTHxSJtlbLFV/DRreeFQ/v+7Z
         tr4JLrMBkTl3UrmxgJAsOF8EawjOTay+O8OzpaskcPxZM7g2+6/DXJBOZ8WJGhCY5IHf
         vm4w==
X-Gm-Message-State: AFuF++leALPpr4SS3KUFPOsrH/DYD5eEK6wfuAufAyn76Wtv0d7nmV+w
	pxqcNb1TorY+HTpxc0JwEthPlBrfwD85SPcpmBSS36+tisilWpaHItLh
X-Gm-Gg: AYBFou1P6mb2vMevMgDD49lngjQc+v3005Ta5BCkervrDtRWrALXV0ZoQ7JevOJg58C
	6fi5BG2mcABVYgZ+p/8Wn5vZ7EHKixd5FDXmDIbAIfh0wqMPtn2XF3coADjA6lnfnK6W883mEmS
	zUKDDDKQLXBWt4m6j7D8Pl3wVifFMhUuXqKDOzPP8wH9YCEpEqp7uxI0lG72hYOJCo8sEqcioUt
	UslKT2fg3pyU3ZEcesQQA9cnR1s46uMWBUFIWyxcGeWyxSGXhtI/NDZcYPCDwu6Df2AXU8KGulB
	rUytO9TwSSCntaE6nPEFWoPtv9Q61xGNyxFwbewN9XIzIOggsXr1LSJu9bcN1G/HJpNpKDghfaV
	O400MB9zpSOe3ty59SU7TzJuybMKL/MOeQAvxUNXMrV6VAqzY3IA5RgGQ/Sy5W2f7FXPKq/GzpW
	0BzJAvOQpYuBoqILtMxZW669lEDVPisDXq6VJXF4135r6RkVSyv1UADJXflpnVClQ3nFrfVJ6WV
	zj9apePV1AD+yOaaGGWPY2FOAq4Xrc9NXDCRO0klseNmBq18Q==
X-Received: by 2002:a17:907:960f:b0:c2a:c76c:c743 with SMTP id a640c23a62f3a-c2ae9f6a1f1mr749798366b.35.1790590106798;
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
Received: from rillian-arch.localnet ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2bf3c6ba9dsm304459866b.13.2026.09.28.03.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:08:26 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org,
 conor+dt@kernel.org, robh@kernel.org, Rillian Grant <rillian.grant@gmail.com>
Subject:
 Re: [PATCH v2 3/4] leds: flash: lm3643: Describe the LED of ACPI boards
 without LED nodes
Date: Mon, 28 Sep 2026 11:08:25 +0100
Message-ID: <Spi1SCcTSB2Ab7fZGVbFXQ@gmail.com>
In-Reply-To: <20260928095015.096591F000FF@smtp.kernel.org>
References:
 <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-4-rillian.grant@gmail.com>
 <20260928095015.096591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 28 September 2026 10:50:14 BST sashiko-bot@kernel.org wrote:
> The subsystem rules strictly mandate: "Only log errors or warnings." Since
> this call to dev_info() executes automatically in lm3643_add_dmi_leds()
> during hardware enumeration on matching laptops, it will add unnecessary
> minor log noise during boot.
> 
> > +
> > +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> > +}

Agreed. I will replace with a dev_dbg() call in the next revision.


