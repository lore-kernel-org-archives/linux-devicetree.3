Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E583F1058
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 09:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791106515; cv=none; b=S8ZrU8NcJRyQ6IEKjMtrqNnIVwomS0BjzPfA5i2lpcjN4K9bCxiPs+ssqaJ+DlvBkZAuwNLesVL+EsRg64rW8xA1KGcZ3vSyDO0AUDOiwjiwk2d1HTN38z29tzma+fttKJZ8W5ewKRj+GwfJLgRrvE8AIqqeS9Jj3QAVGpKlC7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791106515; c=relaxed/simple;
	bh=NxVeEh6zn8foBFrmhLMkMkalU3Ytt/AEGEN+gLGqrTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHwnWO6h9ADDYrpq5r/EsZHgfzFkgXQFibPld4pLJHT7V2pUKKXpvO9chAvFcAfzkMLzTAlQGO14DMPq/NYl9D2CkRYnPwWv3i+xUMG/B95GGhvAlZLBRlZl0UlEt9zvUOCRNy0ws2WjYxOEMXcsIJYWVOjRzhaIlv0LiCMMkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XV/U5sZv; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XV/U5sZv"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e2e0f3dd40so5579715ad.3
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 02:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791106505; x=1791711305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=XV/U5sZvWxpCz1+kuXxNQ76bvIMv1Hc5+hMiRFe5kHT7OV67UNKbWO0ZPh/n/fmiYT
         FdgAtMLWmT+YkBhqc8X+1WSjLUY4NRZgankMG0f0nHCwRIVbvLZsser62x0eWYdJjr16
         d1Exr/QrBKyDd/bHIGnWfciaPQzUWuM2Zf4UynRjj8qOW4nrVJImsTAF3RdVwR30Tm3q
         KKsM49rml3N74IAcbDQUnJjKQM1GGgxu2H28kS9ywUpEtVra/lJYKq+s/kJ9A73b2LPV
         IafXVBwdRGMsZCukCAU4S51aWQjk/pOQ1SgpUAtmxw0t8R/vgoO6cLnGMelbspQRaUva
         0SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791106505; x=1791711305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieoCN8zHQyjpKwxBxBu39ADqPAcaD3Ug1famBdxjyE0=;
        b=syEMMWz6BFSI4efOPfI+zJfGnK3+0dco9CcefP6g9KR8co8sLMWLXm7z93HgX3qw7N
         ip+zRGKZ57Xu+MQiI7dPVnvgtBfgIUMhPQw8alt8lzTK0YmhoJhRWWLYxOvWF7A0jM6X
         lxdXIVYujlDHhoUjQ8sZWaxl8VYcgqxhx1zbyr+WYLvadeLZZhjEXm+HdG81eZ2nJTeK
         PRFpOZzggppEdgi6XVjEbHIBOkpfo9fTt3uP9sliuz4cUrL2qph1LuBxQ+YFvrwNg6WE
         T2ZjyNrAWL1R06HVdEanuKRQuf+mfGLeYJcAkBC38C4F4dEoMlusjesL5HaDmgBhKjdp
         RF3g==
X-Forwarded-Encrypted: i=1; AKwUvBxTnZronR7x8fl0v2BqvhMnxy5tliYF7prK+/kJuplzshxGGAz2njqSpq7ENbN+A0V7fQVbWmZlqz6p@vger.kernel.org
X-Gm-Message-State: AFq9FYKMlNXIb3FRXTz6/OBu4Ho6A7C4iN35zP9KKy5XGDZJUyVR6a49
	r4X1aWFg0vNx/L49SJ/GI4w7qF3YKo1gftTlBt9580Rf9PqvJodsPRl/
X-Gm-Gg: AYBFou0kWyk2RUFdMii6hLnimTkkRz0B//VRSDP6KnfJI1IE7KdLlv3XewDhMvs/NdB
	Y348TplXonhUP4XMBjg4jxgNq9GuZr9CVVe7MBR82JTYQ1+L0Lq3BGYi02pQMlnlsWFh3PRtY0D
	QDUqj7foJaQ+Xc1i6X3FZ7++c9LS7rAmJcB1QeQbuEYIqYKSkjEbCtfkDnZ1OO0ZQEODoVemSFQ
	cUFJE1SYN9asVx2l7y5nXzaLG82AHx8SycME6LHckcPQlIkkrFGB3Q0ZvvyC77cA3i7Ls6861Rl
	9RLVI75LuvVRQKhUc3nJjkg0FjUlpjGdhIPaDVRFlbfrGt8SjA3/EYj43CsA1NUj8gYWbMRshrJ
	uojQmqAq0bRdGD2IdmHZcfbt+45iI6Yc3f+kOfCI/IHTwzUoWou3nELer2DmecpfK8vdrJF+ZK4
	mlyLHC+IoD2w2oqJLCGbnl5IlTcAV6dpug3cRNUJ9UX5ONAzi03gOhK7r4EksNBMBhYDH0KiiWj
	0OBu7eh6XBlPg==
X-Received: by 2002:a17:90b:544b:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a7873db380mr3330070a91.34.1791106505312;
        Sun, 04 Oct 2026 02:35:05 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7383535sm2682884a12.20.2026.10.04.02.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:35:04 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Joonhoe Kim <26rote@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] drm/msm/dpu: Add INT2 GDSC power domain support for Kaanapali
Date: Sun,  4 Oct 2026 18:35:01 +0900
Message-ID: <20261004093501.74290-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Sep 15, 2026 at 05:27:47PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8750) has an additional INT2 GDSC

(Nit: Kaanapali is SM8850.)

Tested on a Lenovo Legion Tab Y700 Gen 5 (SM8850), v7.3-rc4, bonded DSI
panel with DSC plus DP over USB-C:

 - without the series the INT2 GDSC stays off with no consumer; with it
   the DPU holds it on while the display is on
 - DPMS off turns INT2 and CORE off, DPMS on brings them back; s2idle
   works
 - with a DP monitor attached the cursor plane lands on DMA5 (sspp_13)
   and scans out fine; VIG2/VIG3 were not exercised

Tested-by: Joonhoe Kim <26rote@gmail.com>
