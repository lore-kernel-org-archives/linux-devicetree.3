Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281981;
	b=LrF6rMFPao6OuqvfcE70fN5dhwmqq7Bn+w3Z3iCC8epIABwFeIW2HdisAn02884XET+g
	 uoNDSiOozxVBt1N1pbxSLZVONSEq9dRnuaTNX7m6yzq3aLW/K/Jnkmo06DBbkzRhbhQDj
	 X/xrCcLJkOnzmZdxC1TKuzMQSwj0xWp1u7yyy7StOa10CMm8gyfISc4xka3vQEeNbgP3R
	 qwmhdnB6vuIKGMUZZ0m3Pto0V90nIH1+wpJmTcIMMKgXAt7oM1tkQbRYUdJYOoNVUV8qy
	 WZVbmUFLBmBS9EtxCiRmXLg4CkHZVmFhEAqj2V9SYIgljRF/zdyj2BiayL7Y1T+F/7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281981;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
	b=DTcqgudhbxuY+Jv8cHpM5jQSpvx566VMLrh4/sTL044etY8TBuzyL4A6hKa5xtiFlRhR
	 kUrGajkEH9PlNULxjVAJZKDhk+7TmfPi4/sn94MjkPCF6Y4cXZpAGo9nH784jmCzquRch
	 v5tUgJqjSVmL+dFoKqRzPAekrOmFH/n55GM7qOk63m53uLfTIxmcq17y4OL7Daa/HtK6J
	 l86ninF/p0yjMl+IgXBvz4QpuGBGP8C25pgRu64DSQqzp7ZnLWc+MxJWr9p/dJ/l7B9IG
	 Ii/q6GI4HcGCdSgi0+ZWydE5qbCYDAZqPBLcJIhqfzLvYWnUClgednYvf4E8qAsWG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kG2ZI7N;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F4C606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54F4C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0kG2ZI7N
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1780380f8f.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793281980; x=1793886780; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=0kG2ZI7Na/+fZqSMpTthoGDUVC44cSQmfT3MeHnnImjrXkhjCATpCYzi7Ukeo7gh+x
         YEFpmn6TqUeFs3SStpPMsfR2GrjW2LpW1EN4sREE+J5jf3BCmkN/TZ6ITMy03wjX3D4j
         +xP4LdIwoUjyuIvs/2JrAGXg4dizwH1hjYdMvjVEkC57Mpt9pQaq5tikbzCe6sWXAKJm
         tHw1IKp0abO+FezQhxD78UOGjWl1LyiFt3HM06k6vUVmH3sY0CIifrhb9tmLZwV/mByW
         Axj6sfLCQVTp8g1WVK0bs376riYobVEpPRVxyOkDHi5n0UZRmzo8uCZY3WJgn+IayqZ+
         U1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793281980; x=1793886780;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tQ4bsfIGp4xsebuBqH7Tc36g3dw1OgT8NV+OEdsp1MI=;
        b=VtAhs/tvPHB1UWqwPm9dBLYTzTI0Papd7wKj5Pb65zvJJbLtq9vKv89lE0gbB0ZMa1
         8VqSrWFLfH4OCGEL59vvrspqdiAbgJlAlJvnudX31ylaK1MekXlxpt/L8VfqeVdhPR85
         fCUhS48HSEp8y5tci/g8JRPT8PFjp9ONJY8X6Xv3abmj019aCcc39ZTA+VJw5D8h4KcD
         omDuqw5oUMPAYG6rWypf0zKJ1cOaEc25gL/7VHng7B6pQxOd2SQ4oBrRBvrGACVyLxAI
         dJjqYXsFiyOejsKi1cGt41JPJHbRfAgyHiyN3BPTmEU8cwzcAhkDBpRHvhUXhPoUxZDF
         gY9A==
X-Forwarded-Encrypted: i=1; AKwUvBzSe4KSDu8oS8m5waGD1tVrd+DiERP/yTMu3eT55HMwvlAhAl1jJW1UOkv0RT7wXRYwNox3ZWPIIc5n@vger.kernel.org
X-Gm-Message-State: AFq9FYIX6U/arzcMcCeFDgsntJpKb0brSvubThm4i2wxxw5c4kRtfNeK
	1zgONkLJf6ehl4CwILVmHxCajUvM6PvW734QztffvLmSONY6iYKJR4E=
X-Gm-Gg: AYBFou3Zf86hEGbRm4FRS0hNNvQ2h2LKqzwv5lOKWv0HrFeaK9YM5xxZ/wug4YvlzDx
	x3DGDC+iEnviiZIDAcX/h/nrUQh7rw3dMvRUKjArLz+Mt+B5gVfihKghn6kOVB1+KUTC8XwEQHG
	NWrDCneUjkIFzFQ31Ff1CGYKwkuCWeHycKJj/2/y4/QobJZMc6Xl1YLvyfyomZdOkzctAICL+Hp
	gsqeBNQYvOWNzAp3IA9FAXXmQXCDJASGBYu6M9c42N2YIQANWJr7FtY2HCEX2EG0dg9pPQZ24Su
	+OROIzkrjojDFoQFrZlXTqk5hrdwhLJcc8okRYbExV33HHj7k0u/9tojBj2q9FwzqcXGOfe94bZ
	TuKzjL3W6kpq11xGl63yVsnujH4CXpR380VNA64udm2aUus6ONPL6Edk3VAZUID+phE/Bff8TRk
	zruwaiJfrEsDuA+NlqNzlWj3G7ApNWRw3t4d5Yig7vClOjF0rFOz5tfTeUrcOZjN21whA8YDUo7
	lMjHGFGxD8PbJ2YtXmF3D8/B0KH3TJV68TXmEsYBogw54hUSt3xkQCghcbyrKkXvGQ2G7+LY4sj
	BdRaA7hpkQMjIhIGqa+Jb2gPpJh2/nUjaGMiWutQOmNeRw==
X-Received: by 2002:a05:6000:2c09:b0:48d:db77:d124 with SMTP id ffacd0b85a97d-48e5d288b00mr13734288f8f.6.1793281979476;
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:52:59 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Subject: [RFC PATCH v2 00/14] Enable LPAC on a7xx series GPUs
Date: Thu, 29 Oct 2026 14:52:37 +0100
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOTQ6CMBBGr0K6dswUBIIr72FYlDLCGApNWxoN4
 e7ycwCXL3n53rcIT47Ji3uyCEeRPU/jBuklEbpXY0fA7cYixbTAAjNoyWvHNnAkGJUhGKzSMFs
 fHCkDZYZKFrdGYt6IbcQ6evHnCDzrk/3cvEmHfXU3evZhct/jQZS7d8ZKzP/FogQElG2OOiPUV
 fXojOLhqicj6nVdf8W7Nf/eAAAA
X-Change-ID: 20260603-descriptive-name-lpac-upstream-730a164b105b
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=4469;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=p6wqA/jwxyIqcSTHnApGsgfvU2BLpE1567g9tFtfsQQ=;
 b=feq6ZOfAR+NU3cENzB30VH3PhCH4eAA7DfIpVH/eWChVnne9uIyAN6JEvD07bFsgYP9cOKFAZ
 rU7bVnDf59TAXD5riamSTbzdqszxnBeimsLpJilDn62PRDbkRrODEfs
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

This series enables LPAC (Low Priority Async Compute) on a7xx GPUs.

This allows to expose a separate queue to userspace that only supports
compute operations, in turn this can be exposed as a vulakn compute
queue by turnip https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39889

Currently hangcheck and recovery are broken as the patches to make them
work depend on https://lore.kernel.org/linux-arm-msm/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com/

The series also depends on https://lore.kernel.org/linux-arm-msm/177919116291.814652.1720687887970998122.b4-ty@kernel.org/
to work correctly.

It is still an RFC as something needs to be done about hang detection
with multiple rings first.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
Changes in v2:
- Made LPAC register writes conditional on lpac being supported and
  enabled
- Made LPAC a child node in dts
- Added a quirk to flag GPUs that have LPAC
- Hide LPAC behind modparam
- Several bug fixes (including addressing sashiko's reports)
- Link to v1: https://patch.msgid.link/20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com

To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
To: Sean Paul <sean@poorly.run>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org

---
Anna Maniscalco (14):
      iommu: arm-smmu-qcom: Configure lpac device with split address space
      drm/msm: add support for lpac_domain in msm_mmu
      drm/msm: look for lpac from dts
      arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device
      firmware: qcom: scm: Configure LPAC aperture
      DEBUGGING: print contextbank and other ttbrs on fault
      iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac
      temp: add LPAC regs
      drm/msm: initialize LPAC ring
      drm/msm: Add LPAC submitqueue
      drm/msm: set ctxbank and asid based on ring
      drm/msm: add lpac ring to devcoredump
      drm/msm: gate lpac behind modparam
      drm/msm: enable LPAC on gen70900

 arch/arm64/boot/dts/qcom/sm8650.dtsi          |   9 +-
 drivers/firmware/qcom/qcom_scm.c              |  18 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 200 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  20 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  99 +++++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |   6 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  62 ++++++--
 drivers/gpu/drm/msm/msm_gpu.h                 |  18 ++-
 drivers/gpu/drm/msm/msm_iommu.c               | 170 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h                 |   7 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |  14 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  14 ++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    |  38 ++++-
 include/linux/adreno-smmu-priv.h              |   2 +
 include/linux/firmware/qcom/qcom_scm.h        |   1 +
 include/uapi/drm/msm_drm.h                    |   2 +
 20 files changed, 575 insertions(+), 114 deletions(-)
---
base-commit: 9a967125427e03c7ebc24d7ad26e9307e8403d4e
change-id: 20260603-descriptive-name-lpac-upstream-730a164b105b

Best regards,
--  
Anna Maniscalco <anna.maniscalco2000@gmail.com>

