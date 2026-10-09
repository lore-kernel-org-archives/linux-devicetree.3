Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BF34749C0
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547591; cv=none; b=HenyXg8zHVQ3E3cxxeNxLPNsnWHZzgT0BdodFCxdXUrULCJyy+opHb2SESTqOG2JSrCYQaA4IlgbOBAn7Z0cdZL03RT2VzT7snSHKAG6q+iVXYg0qnjx4QASoWBkna9Jsx4ZNbaoT21WcyDuD7pwYOfkh/NuGDExAWey/7g0zME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547591; c=relaxed/simple;
	bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JzzyjchJhFA8YUwYNwOa0PNBXlYTa+Fp0SIT5oOpay3Ei5wGLI+xXBpDQKrDttsixmcC7OoNfCpxwE2dbGp7hKHDyUrQrI5NX+Ix5RhqIcuW61PiMHA5qqKxCQ5r5u2yBoHp35JytwdOjpdm5cuVS5YncRLrkzZYGg41J21hUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFgOMjS1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EeEJP8Au; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFgOMjS1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EeEJP8Au"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699A4fh01336285
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 12:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3baEXoP0uS0PxL6jcVvm1v
	qspBsroAlCY8IAaQ8W77A=; b=ZFgOMjS1V2mFDZ6Jhvugk13av5pzCKGMctKCck
	9qbJWmoXxVyejXNy12e/3AL9ahmZBT97FR2tU7AEW9sR8+2i0J7aQe3/QOHwEar6
	l5xRnVlBHgMuruQXgzMkEAN/Et/t6WlL6fomQw+gJ7N7Bpr4wzrC/xznUEgRigeB
	yK1vOi++wI165p/nn5mtYhUr4U8vHGnwRWipMtXZQaiBnucUSHAMhAZ+aYEqrKEG
	6htw6cOLlVmjuEn+k0zItX1B3VfM5CwpErGCxToXGVCSCoel2q3EQAu895pXMrBE
	AhhTKZU48r1Hh4cbxtpmw365QDWOqmBr5XFXCtZ6hokaZa1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6x6wgckh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:06:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aaf955db5fso2447024a91.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 05:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791547581; x=1792152381; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=EeEJP8AusqqZ+ia5k0BSfS1FHksUgoq3H0PJr4JC2jMLTid0V0Vdb/b4lRfQE5JdD4
         LMBckQhwK2X8JcjBSRN9rGwwoLp+wOfmPNNigaKegWNTk3VkeqcK1yPDjP3WIrWAzLAG
         XWwQA+m9QEImm0Mp0hPVtk8dKwCoTa9kz7kns2gyttzywpqGXKqDba9sRdORyTXjQtVf
         8eCrzU7L06enk1xVzFXNHzrpyD/X/3BYhNv2jKgg4ckP86MQN0aZqptHN5w1kqFm7irL
         pbBJmLSLsHdgqydQk8eoB47epLr2oOL8a2vZU2KJAHru9Owm6tvJplH+1z5w1ir7xJCx
         Hf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547581; x=1792152381;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3baEXoP0uS0PxL6jcVvm1vqspBsroAlCY8IAaQ8W77A=;
        b=QG0pnxratNvdCbbQ6OC1DTh4KvILGgMDjBJ7RAQiAfDnY6Gyxt/liydJdzsYuXqLPH
         YDrqIeSsEwyheil9jYafTCXYjhMSpLTZi+qxtUXA26BrnyiIKE7tgij3Vo4B6ajkYoDQ
         fMV8jrva0RUJ/xATelKt1f9yvfJFW/fq06GrIqw9oLveXkBGymDWTshVcn3n+G72PKeg
         7yGxDFAg7O1cYhzZrgfDjeKfNgYzE3M6mTCussxVyCrvtksVlsv8OV1MmiZCHjZm3vKV
         lYltsFBDTjlcsI88r8V3/ZGUdvxtpp+jJ3a9nQdiLaGlXW62V6+jsI9wt51ZM8yeIgrJ
         H3XA==
X-Forwarded-Encrypted: i=1; AKwUvBzP6LsXkscyF1Xh1E2AFchiPkV4J8IjGJ0VZ7r8D7lXOPtb0kSBfr/+PmiYMaxyIxEezS41+39kZxye@vger.kernel.org
X-Gm-Message-State: AFq9FYJCwvNQMFh7O3FdNg67VmhjzqE0AycqkGArhao+hM8OIQ8nKmJj
	S4T/hXHJzU/YeQkfw5FG42711oF67wjlSF1T867aspYszP7/+kULZ4wlCZmByTOwCgAhxeVbPv3
	HBLOHG6BT6RFulz5/MNnwuPMFNM1ij/nREIueeHnEVHiAtWYX7Sn5cZQg4/TW7Az6
X-Gm-Gg: AYBFou28xRO+E8yoGaknwv5Hxu80f6nARul28dtx6HvXH5fXbwXPmRe22AWN7v9Z57A
	bIBXV4e1nIJbxUwiQxb9u6tGPN/3aHiebw8XDWQIXfTcikALbjS9ixwILLajzKNi6a3vybM+BGq
	2Gi1z1SlU2VjkzAUAVwRrd5k213XW2mLgFBSJcsVVSNPNxaVwd7n2dIs+Urbh6UFFNI1mryfq2H
	XWPlFOPm6s1x3oxuNb7+mJNGS2ZUsz/XdJ7xkoyiy96lvOKfQYXgzcDmLlxuxOhhSBgmvyhM2Q6
	8alwZbFK0O6MQHkkP1IBB09WxFpy2fdebeiulLYv/ZzqK3NEm8hut7IU4T9MPsVu+5jdF4yRXEi
	cIK9aD7RrnkY6fmT13sXJUyjdt/7hhQ==
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525763a91.17.1791547581427;
        Fri, 09 Oct 2026 05:06:21 -0700 (PDT)
X-Received: by 2002:a17:90a:d2ce:b0:3a4:97ea:f0da with SMTP id 98e67ed59e1d1-3ab3a735fbcmr1525731a91.17.1791547580936;
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm3254084a91.12.2026.10.09.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:06:20 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 17:36:05 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Mark L4C regulator as
 boot-on to save power
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKzYyGoC/yXMwQrCMAyA4VcZORtoRpHpq4iHtc1mZDSSdkMYe
 3erHr/D/+9Q2IQLXLsdjDcpormBTh3Ex5hnRknN0Lv+TM4NGDwaz+syVjUMqhU14+IjDonoEii
 x5wla/jKe5P1b3+5/lzU8OdbvD47jA72wsCp8AAAA
X-Change-ID: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791547575; l=1467;
 i=kamal.wadhwa@oss.qualcomm.com; s=20260406; h=from:subject:message-id;
 bh=KW0LlYcgIekVd5iwGN9xOxzzRGAL5Lf3F0H9QU9QRBY=;
 b=hF6mVqPU6Oo8YNpQFk42lEb16ecqMPWDYSfxLwG+01VnmnB7GgESqZZhg2CMymxqzH3FYIf7O
 Wugx+N6I1XVDbHapLk3T5ECFEFld1an9JQ4366iIcz+XEuwmzFUGuJ1
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=ylH1NxUZkBpYsmww89g6zVxpS0q8qthtzcORkYxn/Ag=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfXwrwvmTdCdLoW
 EPt5O0kj19Rw/rjBFpdMbhZc/2SkymV/MIyMSW1quUZaCWWVi536HkfwvnvZmHhgzQUkj/rovNp
 R565pRSSe3CC2/mz8weyF0IAZU+idug=
X-Proofpoint-ORIG-GUID: 5QWm6JBtYxIWhMJdYcDyR7G0-Rqm3KwR
X-Proofpoint-GUID: 5QWm6JBtYxIWhMJdYcDyR7G0-Rqm3KwR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0OCBTYWx0ZWRfX+586pcFJRybw
 6edrqF5iCOwROwnq85Nr3aEld1XKclwr9EiJGTcMPElhTIezI3GkCLyeZ9NesiAxA7J4pd4YJ0L
 i1lt0Iar4jYMjaz1BvQsws778VgB7IzksdUTauMuSmZT+1OZY81uS7riUyY0j3Y6hBADnuOnRd0
 RY7GNWS7oLTbTWvtV9+BPGNcVmlFmHzKN6RvUsf64eNBPWRndYhr0ZIs0829CHYGfO4mhoBJ2dw
 LUfPuNVDZjrW9SJ8PElE54BkUb80zUHK+vTHZJJx+VwPjqJJaCdwRKrjsrzJty5fqu6K7T0k/qP
 SCHmwfmKvFzP/bAWgFtlm9FP4swC/SoYPxDpk81M4n81Fnp6Cq0B4J7Q5JhixIczzaIunNdGCrO
 T4k4rdY3ZzDdO+1FFYMAhdUIt+vszw+9W+LiA5MniBYxA14luCpHK92SBfVNuWe+uOWlHWWMRqo
 9iqYBJ/v5kBKmOA6vdw==
X-Authority-Analysis: v=2.4 cv=ad30Dhot c=1 sm=1 tr=0 ts=6ac8d8be cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=NK1Zv9-Dd623KQK__TcA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090048

On current Glymur Rev-1 boards, the third USB controller and PHY are
not enabled, so the L4C regulator has no active consumers. The
regulator node cannot be removed, however, since Rev-2 boards will
enable the corresponding USB hardware.

This rail may have been left enabled by the bootloader. The RPMH
regulator driver cannot query real hardware state, so without
regulator-boot-on the core assumes the rail is already off and never
issues an explicit disable during late cleanup, leaving it enabled
indefinitely while unused.

Add regulator-boot-on so the core knows to explicitly disable the
rail during late cleanup when no consumers are present.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..ab4c9c33f4e6 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -472,6 +472,7 @@ vreg_l4c_e1_0p72: ldo4 {
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <720000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-boot-on;
 		};
 	};
 

---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20261008-b4-regulator-boot-on-l4c-8d119b1de4ef

Best regards,
--  
Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

