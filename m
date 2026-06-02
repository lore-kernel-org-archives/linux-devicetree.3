Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBDF3DF003
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 12:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780404883; cv=none; b=j2ttznQ0oU97Um1zbXn8fWeNJ0HLLq4lhRFzPV4y4T5Qdof25HfRPz1giTBw9+7KVTNler7rDo/orsm7v765/uMzBsiQL9UbxQyfWAxn3kkjiEx9rvTY8oOaxa0rpsYGSkhiBEbPK7zfV4HbX5abYBh4YE9UNWHfqhET/5RRsSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780404883; c=relaxed/simple;
	bh=zQOZPBrgpfZjqODyyKAiUxM7OwUcXe4zzYiOVBrwJGQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Vd6LgomJsFWfBErizek3jqlA9UTbW5UXq6UwQDIrYQZNNIJcdipfr68RPzZ81xyCqihLUCoE0LEBeEsl7QWk3xjAXdWb2hCSJ0HVq6xo+uMlufJtYnzUGenvl94Teirhakm6o6lurucL8Nf1335hSm8PILnm1Gw0kRLV9OUsM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxd2rf0/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxd2rf0/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf02708e8fso39127845ad.2
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 05:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780404881; x=1781009681; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlHVyX//uRQweKI8AEsyxUDPsp1hZA4ulnXxEiRJiS8=;
        b=Jxd2rf0/EzKSy3C/zB0Spm5gIDg5rRtlRV7Rd/JtcNwiuygIsOAFd1PF5NgKxJDzV/
         khW9jkE2RVZYZzxDiF8FOKbKN6s1rWXVjpJWq9S6gFUhHY8d8E+cbyx9M46mr74GnFV9
         JIvhJGNnXCRtcF7Um0xzii4b4yp42U6ivr3ut/o4c4IU8WOGnNd/5coXL+NdqXU6S1pu
         kccWVhSbsCCWAxzL7Uddbt07OhR7NWkCp0XchMGN5iaKwUKgr1LGnNqhGsMv3rOi+iXT
         rYuwcCFM8mqTT/XFbXYMbWe0ia7tXAZMbbDN0tEG0F1cbb/q6yfaXvmfElCWI3Pxj8UL
         /EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780404881; x=1781009681;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QlHVyX//uRQweKI8AEsyxUDPsp1hZA4ulnXxEiRJiS8=;
        b=HVchFFhKh7FRhtfQJHQpEoW7NHTGtyXrbjTeS+UvO0I8sjjq7WskISHs8qAFTLDsIG
         J/Ep0WhpMiTlj6DmorNeF/47VguVsPqvxCrYEe1+lShXM38NGNECfkSUytYkUf1sTORB
         fqZetSrxzxDvy3ov/8KOZP/0IUZI3N00TpypOwn4mnelKktZoz25/ThxFz8UoAPtwm1u
         X7ChORpNW+gGvYmq4Xk2IMfmwUO5JCprUwIlKyr0sEAs+VgLkQaUOLFXGkbFH4Zc6lAu
         9/QFdVm0DIJlZAHt2cdjGThZX7hCtPZoDGAn6afgjqB11p5iKJVTxwWMvHXqlz2j3Llu
         wbhw==
X-Forwarded-Encrypted: i=1; AFNElJ/iNPnW075LEjFv8T1FAei4EM6XmIsKLTSf3TIu9+zxzpSIn0WMCMqWtFQpEB+g8VaVzWLFDPS14eZo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AstPcpis7ZzS3TKasl9QTadhP8KGPB+PC2U/3fNzx6JkyJGX
	EniSRXZXQjHdAHM5lFumIfq+oIR6Ed9OOQYGFyN3UyokfjA+mriQQFRD
X-Gm-Gg: Acq92OHutGn35uBp8thJ7Ngi+aRR/AUKHz163LatIF99Csle5X5eUAvL8eqch8TzcDb
	s9A2ltLRaomSY+buU3kF7lDzp16UYVBxOsBf1KzAyNHwUZLGYr3FYytMMwmSXlDRgUJ9XKqRFm9
	tcu+Jq+nFsT5ys6Rmoz/xGc91PwSLFbfNFN7NKyQR8jLyAhB7k30dZclKXngvGPLxsXr/UcRQg5
	VVandA2/UzOEnBZhFMUDAHag13UpQYnS8Iqh7UhiPEAfKn6KAVHYac5qPvFqaUSq0fKplO6x8D0
	KD0EvgofB2Gk7lfCCivW+NIE1UHrvEmd6lAd3wR6x3++hL65NwjCS/fvW+yPvji9FoE+I54Z3Oi
	apfcDFgIL3NeHuVN7wf7OSD3lsnl09j5WkhD7luAHuqvqKI/V1BUpY2e5H9cYhzOyE1guBz6GNV
	nvWtbGqb6JVJfHi18EnQVt1abeqZaiDdc8i+vOMpu6q23t+Qc=
X-Received: by 2002:a17:902:e881:b0:2c0:bcff:e191 with SMTP id d9443c01a7336-2c0bcffe248mr137229755ad.36.1780404880526;
        Tue, 02 Jun 2026 05:54:40 -0700 (PDT)
Received: from [192.168.10.11] ([2409:8a34:5f30:f0f4:8da5:4634:baf0:dee3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c2da36sm167581305ad.69.2026.06.02.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 05:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sc8280xp: set GPI DMA channels
 according to DSDT
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
References: <20260602081451.3808833-1-zhengxingda@iscas.ac.cn>
Date: Tue, 02 Jun 2026 20:53:26 +0800
Message-Id: <178040480680.1778078.1165164069560552075.b4-review@b4>
X-Mailer: b4 0.15.2

On Tue, 02 Jun 2026 16:14:45 +0800, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> Some bugs of the GPI driver exhibits a fact that some GPI interfaces
> aren't available to HLOS, and accessing them leads to system stucks /
> resets [1] [2].
> 
> This patchset sets the DMA channel mask of sc8280xp device trees to the
> values indicated by the DSDTs of the corresponding devices.
> 
> As different devices seem to have different allowed DMA channels, the
> value in the SoC DTSI file is removed, to prevent new DTS's from
> directly using these broken values.
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2142403
> [2] https://discussion.fedoraproject.org/t/fedora-43-44-beta-aarch64-wont-boot-on-thinkpad-x13s/183074/13
> 

I don't focus on the upstream for a while, was this problem still here
recently? Could you attach the base commit, so I can reproduce it.
About one months ago, gaokun3 worked well with Linux 7.0.0. I enabled
i2c4(gpi_dma0, seid=4), spi6(gpi_dma0, seid=6), i2c15(gpi_dma1, seid=7)

I thought this commit should have fixed the issue in [1]
https://lore.kernel.org/all/20251013115506.103649-1-mitltlatltl@gmail.com

-- 
Best wishes,
Pengyu

