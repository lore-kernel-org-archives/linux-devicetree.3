Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C53FCB1E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 13:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294419; cv=none; b=VxZ9m6lxYd17pctmnMElCi3vr3hBXnmPRbGPQ8SQx4JQNRKqLCyAbVe06kqZNhYr8uzaojH0hp0534yUBgP/Ez1zNZlPWXX2rU56HeBAJt7GLnxT+/GAtefwDtWknbSGcp6Zsd/CvkAX7D7kTzTIcKkcwWTnpUhYQSl395YPjLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294419; c=relaxed/simple;
	bh=Vij6gTuB2IbPu8RHSX8DVU8gbwxXjKYqNrf+scD0CVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c0EBQ849Leql/hYLCacE2juODOsKHSvPf5DI0AlDMzahv5gmvCHUfbSu3PL86jPZ3bZIYxxJpXLiGZgjlyxKw80pdcy9/sEfjwVgn7T+OqNXwjOZqS2hASBcr3yO3og/Fwg/oYNWeK2+gDl4P7nGJzgk3tMiXppJ5kDhGdMFWMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=igS+ZGI6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="igS+ZGI6"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495441b72ecso9374685e9.2
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1784294414; x=1784899214; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2BvHPB3SGSXQyfBzrX4v3mVNOezdsBFjJjO0Euau75s=;
        b=igS+ZGI63o0H+Q5XbAkSpDQyAfZdlevmMtC0Fv9i8KwsAqhxLUZls89mYUT/u7MAqD
         geI1OXogN88cZDKrcIpiUWn+CeT+QaHWlG9Zo7jf3/Ria66dkBupFk6NZwJUx5vYlDm7
         K/Cylp7D5TovL/INMTqqiKVXkitM2XKqn2W8f93ZOnoq4k7Ku9MPmq6hWr3oeN9dm6zy
         +QyveDmG3mMVNVB+zi2Qs1gAiNC2FGJnNlmo7GXKdEB/nUTyr8sHVvzC0lhVBcAO9AMN
         zDMeG+ue0z4a3t20TyhlVGAnCPd3LAb2FzLmjKa/28fbE2vm2/vhwdvcisMFNSZRbNOy
         s+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784294414; x=1784899214;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2BvHPB3SGSXQyfBzrX4v3mVNOezdsBFjJjO0Euau75s=;
        b=ZQR20KsJsisM0COV0+TAnFA4DoYfuCGjdlSw2Y1/swpF7gPcr3T1xpLItbPsMSPgF7
         GTbsDmw3ZZh8BLpeI8q+OIIP2Tm0qljsHVdW337s2Ux3ogE2WMY0eOp4OA2C/p/VHjAz
         nFsoutNhBFmLtxSt56Nl3HrrPw1KRdqgtJMDwoyF7UoUKAvdSZ6tYIhLQDA1oHwb1dL5
         BEx6TA0NjTNTTqi0lc8tDJFSoNA2tiRbIqqxYgsd0tuznwLphmFOUJQE2Fc1eMH/VHnJ
         zwu4T9IGlx4VkDLuQsxY4gEDA21hVSvuUa+t+dukCLEUTqUi3F/wvwaHKGTcJDTN0mZ+
         61Pw==
X-Forwarded-Encrypted: i=1; AHgh+RqphczCjpAW8W3Ry7l9sLzz+QO5DW6aex0X1r6cdRiKaxkgSU1ykjBpzyXPoi2hOA5KInfd8Edl//zS@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxusNrjZSxjJtju2X7oCJH1Ub8hWidXaYbtUWZf0hLEq1Jdoz
	hI1p/yNOShVMNSauqvmcgGNiT6Nb7SvBNolmZql3sIG8WrbTSbMqHLR2TY9kPvSdEKM=
X-Gm-Gg: AfdE7cnxkSMgMunZ8+I2knkKt9T9KA0+lmaCxAt1KhqjMpJbfDOZTgtBN5PXwqdJuBV
	SKSw8/srZhIiPWPyWq3U+GBA88KBGNGv9btUZWQUFMkUqUASpJs726wKK8WilqS1OGqvPjJcWPn
	emnUdtoLyY5S3m9WABuawJLJOMWaQC/GjDkYqMvrJLmpHBY8oyv8AQ5ZForm3zfeJDLjIaew7rb
	17zrbLAP1dqfkZ2Z8dgOEtvWqFoTS4AC54VnMz1FKjiFzUuLPXQ9soqYXY+omROMrQkl3U8n6R6
	AdGKiJE30cLmEMyZJhUVjWTrtNbIn9RGRYochlXVEkYlZJcJGUNXK4C1OIsESKhJ+v1vGi1aLp+
	wfuUpbzvUIqloDpwCdlqq0R2jZqEzECgt8DjIhfSYyVhg5+rs9eABMtn863uEuW0nib4vdEEtK0
	V2Dr98Tphnez6aCU6nHLJuMmB9Dw==
X-Received: by 2002:a05:600c:4f86:b0:495:3e81:76fa with SMTP id 5b1f17b1804b1-4954e1e065cmr1074925e9.15.1784294414391;
        Fri, 17 Jul 2026 06:20:14 -0700 (PDT)
Received: from [172.18.170.139] ([185.104.138.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954ba2abd0sm28220295e9.15.2026.07.17.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 06:20:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] Sort kodiak pinctrl nodes & add camera mclk
 definitions
Date: Fri, 17 Jul 2026 15:19:31 +0200
Message-Id: <20260717-kodiak-cam-mclk-v2-0-04451f1374bd@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0K6dkxbRZSV9zAuSpnKiKXaFoIh3
 N0Ca5cv8/9/M7GAnjCwMpuYx4ECuS6B3GVMN6p7IFCdmEkuT/wkJLSuJtWCVhasfrWgCjwXdV6
 J/Jyz1Hp7NDSui7f7xqGvnqjjMrMkGgrR+e+qHMSS+78+COBgank5GsP5QcmrUeTfjetwr51l9
 3lTePz06fe4eVmlAkK6W4pl1uEYYTUUIk+N+QeaCdjW9QAAAA==
X-Change-ID: 20260612-kodiak-cam-mclk-a7e87d5b1585
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784294383; l=1153;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Vij6gTuB2IbPu8RHSX8DVU8gbwxXjKYqNrf+scD0CVQ=;
 b=qs7sS+9Sws9TDqoxHLKHJjn9FxMOtP1EnH/U6zR1q0GvrfRw6uJbeLqd6r1l0dTYAoSOnu8Ym
 bGD/d1hKhAhCQns6vPGfeDWwRxT7vSxKuw4Qpw168HfabB5x1l09Fs7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

First patch is just cleanup with no functional change, the second patch
adds some camera mclk pinctrl definitions for preparation of adding more
cameras on different kodiak devices. Third patch adopts the new define
for qcs6490-rb3gen2-vision-mezzanine.dtso.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Add patch to make qcs6490-rb3gen2-vision-mezzanine.dtso use the common
  define (Konrad)
- Pick up tags
- Link to v1: https://patch.msgid.link/20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com

---
Luca Weiss (3):
      arm64: dts: qcom: kodiak: Sort pinctrl subnodes by pins
      arm64: dts: qcom: kodiak: Add camera mclk pinctrl definitions
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Use common pinctrl

 arch/arm64/boot/dts/qcom/kodiak.dtsi               | 1413 ++++++++++----------
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   13 +-
 2 files changed, 727 insertions(+), 699 deletions(-)
---
base-commit: 19827e7930a5511c68e12aac6e4522f3661a1709
change-id: 20260612-kodiak-cam-mclk-a7e87d5b1585

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

