Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170215A864
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250789; cv=none; b=YnrumOzw5a1D02e6uBOcVHEwOgGM7qjZdeQVfntd7E365g6WITGYAWbHcWbu2BEke7R5F8PBpwjI1hpIIs6WyFdTYicyqQCJL3BAwphISdXRbvZMVpI3vEBDGWI3UI64OdbRprtE2iaTK8uu2wruJ5hfeW4Y3RoJEfJyzoWmhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250789; c=relaxed/simple;
	bh=oIcfdpG7eG8XSvtpKL7cgaYhau7r1ydchvgQknzsf8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WCDwDpyJymwgZBNFLD6BAQL20j3Pgj4bH+ldinbERhUMA2f9rRKwQje01a1J/AhyBwYEM98pVZztM5IBmcFolJPVSlZE/Mu6sWz0vmRHlLZgeLJP0wLqfDU5N6QcqaM1NbbNpL4TiXWfZiMBjdOvGkY6CD0zufq+12Y9I8EGJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=El+Wbhbo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFUP5mj+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="El+Wbhbo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFUP5mj+"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QHIAMr2001781
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:46:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATD
	tueDjI8I=; b=El+WbhbolOnbBnx5Mkol1v71SvLDrLNTpJAqR99yWohH4XW9qGg
	xvgGl+He6Tge3uYxkyAJQV95bkPLCNV/07CngpLrO7j+koPyy9vHHKG3LgBo8z6z
	efU2SI2Sad7tR2bx1fBqAwPATeIc9Z9WwxkPS3puimIKOpOpDgIQ552K7x0tjpve
	xlUL7JPH5dtGIeiLcp+C2xiBWAEkS+ZPJSf+syjdBruZkGhNl86XtdkeJspaEN+K
	qfcmksbAvMqm1WsOu+wNdjQual1SFZ3UdUgGnTvrrWzIeDxF+idluBtOExR4DzXH
	T+bZRA7Fp5xr7vQfHBoNK/ErJm8OF1UP65g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtbvr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Apr 2026 00:46:27 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2d93379001eso22165583eec.1
        for <devicetree@vger.kernel.org>; Sun, 26 Apr 2026 17:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250787; x=1777855587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATDtueDjI8I=;
        b=SFUP5mj+AOBD/khoQZhwEo8G1Pmoh2+tjor+YPy23VnsIvYcYpomz7IPr6CrVcm3u9
         iG4Gw11s9nMjebpT3OfmmnzMkjqaK2T7kZp1SEzKzWmSSsq7yABa9+QMMDpsXnp+j3CX
         IIbQXdqdIHwkz9fAkEuVLkOFdjJJneNSwBkNQow5q4kSomeLcCgxZqQdqlowsR3jtV43
         bVgJ/gcpaRTvz+xsePADI6dyHVduhAZW/xGV+MyeefBBmmNV0Kn2HwH+VDgrNh2VjCgs
         9WfyJIUyFjhT2C63Z8zLCBnOoR9kMIVzLKpZjJaGJ05bAru1p7rFd7rm4E/BRIvfUCVt
         ByAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250787; x=1777855587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/6cpSorma6nZT0eFjtVtWXMVb52gYF/LATDtueDjI8I=;
        b=rk3LW0aHl6VqxrccYCtNcFrOeQ+NZS1DhQd/jirqrTLdMKXvndcBNEGo+Shy99VcSM
         JpqG/ve/RQc8GyZMDCImCBzBVgR+VnR9igFq052SICQN5T0iInk8Ugw2jKe0JOZgnrFL
         sXt7hDjnLRBm3rac/1Isk4hODQ0y1w29tBxf1N/xnjmSk5NRIbQ+iPOjDD3AGY0G/6+e
         V3dTpgdH25hEIAolQBI7M+kfWExinP0jmXeGO1ykd1YyZVO9/NPYgF6HbzTSTYGPBSfc
         eeIN4+yfyao/V2+vpt3Dr/KmfKpEFnKuvIdKGvoIbdXxxh5QjeajcG51I3PTtHE0c91z
         tqcA==
X-Forwarded-Encrypted: i=1; AFNElJ+72yY6Npxpumd1uNcFo1ZBB5MHthflXXEAaMF3aMwGyK2ggUA8qZ4wxwTDWNvoRFmltsm/GLQHsmSx@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaFQn0cwCb68ywh4U9b+kd4FnxHro2Uc34Q3we2LR9wnoBPxs
	sqnWWxpDxShZAGPTNr9drov6PUW+nRdwZJgTeI02s/icw9n4NCKLUEPa2tgkoiBaLKrQpIIYLIS
	WUNbcm8GCvXhmYYfEDqM2CfmzR0K8M52YkE3FOi/aoZkvz1mIh9ejzJAm7oeP+ov+Fkb0qB5K
X-Gm-Gg: AeBDietZdXZe2kpSbh/t6xdLuB1gjygle1f2LSMGApAeLS1e/KKq5QBJfEboyij1M8l
	AnIPnLeREsZniVyO6EU7R2g82NnoPPEhUg9O7JVy/y9Yi6uUuAzIVb69cd3pm5yDQ8Bk05/OkLL
	lIRi1NwATd43pZyfbripVgSkhdR0FfhGLaVEPlUNQI7hvBfyvxJ1rBd6KRzK+7lV+3SYJbSkej1
	EDrcjAAcUQTr8z0zBF6xfYO2Ru68EKjGfBi7QMz5ik9ql+xHydt5AeHUITRC5yp2Yi//H3xqOG0
	ry4BXX6lCVzJ+3ZBCUo2Thvg9RiVPXa356T50xrE3c2/2CQemtfToXXem4A95rKv6uIauU+UkoV
	b1HFgpLxjLqlQh+2vrPjhLRI6bBsZ+BGNq6rZ1hma5CHB7a1f3o541l/7c6hI/7vgenabjeIM0L
	z3IMSlX1prYsrAgn9I
X-Received: by 2002:a05:7301:f0e:b0:2e6:ff79:e34c with SMTP id 5a478bee46e88-2e6ff7a0431mr13152208eec.8.1777250787146;
        Sun, 26 Apr 2026 17:46:27 -0700 (PDT)
X-Received: by 2002:a05:7301:f0e:b0:2e6:ff79:e34c with SMTP id 5a478bee46e88-2e6ff7a0431mr13152201eec.8.1777250786625;
        Sun, 26 Apr 2026 17:46:26 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm42529350eec.13.2026.04.26.17.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:46:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND] dt-bindings: arm: cpus: Add compatible qcom,oryon-1-5
Date: Mon, 27 Apr 2026 08:46:19 +0800
Message-ID: <20260427004619.229843-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69eeb1e3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=cSziVDP4AAAA:20
 a=EUspDBNiAAAA:8 a=uuEWxox96XwQUwFBWecA:9 a=scEy_gLbYbu1JhEsrz4S:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: LSQkjs3z89mB8_CleFjRkY4mK58mWVQO
X-Proofpoint-GUID: LSQkjs3z89mB8_CleFjRkY4mK58mWVQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNSBTYWx0ZWRfX5I40CLbt6cQI
 YQP3w3nXZF4f+QZRDFNBNxtDrxVp9vN2dMaU8y8DwS3gbyHvXOcvcDK/aJc6N0hx6752uPWyzJa
 DAIt19X8Te4yGmkIujvTxFx6jc4I+AdeWIUf3kNto5yBrxRVMvxpVV1X/zkLhNtJBmBd7wWTbTZ
 GJfMRK+PfNI6e7WtIcxoMNqqdJVXRytioKdZUumV1hI6mBvJ6lViI8h0aR+3sAgO+y/NkNwr6G6
 1FpMjtP6gyj5MvFqlKvYkqfQJw7fRM5LnuXcljMFINlAyukItg2fcZadnoqNwJrmnxWc5jy9Byu
 i9JB0EELyqPm32kXs6rX9G+X8tlaUWAEVmGjTnHRKzQHhFchw6Yron/G3NoyA/Mj5WpxyWpSru3
 mWFsfmZNFn24arQJA/q55l2C8JowI/VqqMK9/XTHrHmEQcye7szBusiUw+mIWz/h7xA590ZyoHZ
 kFTfLQ6WLcDDkp48vrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270005

Qualcomm Oryon 1-5 is found on Nord SoC.  Add compatible for it.

  $ cat /proc/cpuinfo
  ...
  CPU implementer : 0x51
  CPU architecture: 8
  CPU variant     : 0x5
  CPU part        : 0x001
  CPU revision    : 4

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Notes for resend:
 - Rebase on v7.1-rc1
 - The user of this binding (Nord DTS) can be found here [1],
   and will be sent for public review shortly.

[1] https://github.com/qualcomm-linux/kernel-topics/blob/early/hwe/nord-next/arch/arm64/boot/dts/qcom/nord.dtsi

 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5f5ff5e51e51..5be89c584026 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -223,6 +223,7 @@ properties:
           - qcom,oryon-1-2
           - qcom,oryon-1-3
           - qcom,oryon-1-4
+          - qcom,oryon-1-5
           - qcom,oryon-2-1
           - qcom,oryon-2-2
           - qcom,oryon-2-3
-- 
2.43.0

