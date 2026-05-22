Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430CD37C101
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479669; cv=none; b=Qt2vT5Iks9NUga8cWFJXVqTMztQd3oihA5P3cT5PZNUxQYXVA3P67EmJPpKuocD+uw/dEGOxe4m85EnV8z9HL56j1wXtUh1m08MC11XPBH10y33/u8occHD4Aerfj1rtc4JUNk34+0VrFli7cDJHJYeytzD7IXMg49ctjBlhxEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479669; c=relaxed/simple;
	bh=i9MBdFzrI+T2jk0ViJKl4zXMKLNv8x91iQqzdHJ4fDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J9hz3Ss3V0h/P1IgHtkabQzLMjVpYgN2PLwR+dZ8nCga6IuuFsJSwgDiJWoaxxnamUyzI3cj5AW7JwAVC9otvwsxsHFWDzahDZfhnqHgqQjDOodEHG40Ac8h//Ls6Q/F/p/1GO3DOuuKj2MFWpvWZm+ssCReeS2aEnhRT3PZORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0sK9n7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcLOwwXa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0sK9n7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcLOwwXa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0cIM3476974
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NcJPHaxHIA1
	QngimO518kdxRKpQYY7oqTYXRYDZuXK4=; b=a0sK9n7nxq6gR1BWr6Bo1FUhPPE
	oODNjM+FObahbT9jy5+tjBMPtixMxErEwfh+76MQ8XABcYNUTVwksN5jizl2OiF8
	LZYyfkK6HVgaFG3JZF9kIHbbvqDhzMI8DKXHidiwgZsh90nJ861iwI34aChqPGFh
	W84h3aypsD9x6ZAE1CuhrkdYBbIkn4GOgoavRl/t3WcVZ88gGir/KY4GSwpVtb0E
	8qVTpWYgojdKLAAwNw71xZrYNHVohZU30qmfD6RVcV1Mxhxz7Iex/LGW5KAEtkiR
	yh67lwRs9FgD2t42Q+dFpK8MjbQjkUK4Hz/XCRItqoYx0sUHyxjEWMJlTVA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8t2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so7624167a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479667; x=1780084467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcJPHaxHIA1QngimO518kdxRKpQYY7oqTYXRYDZuXK4=;
        b=NcLOwwXaNTiW3zw0mJfwddqLi4XGDbmnu76yrTmh+J6anwiTw6O553DN4DAnIVovdn
         1EzQe5q/1Nvl1/vJB23i8/2/dcEDTMwI9FrCgrsN5OXIh4Ei4ytfnT2SK7znZiJALUx3
         VS3riy2OF34bDSi4nta+zCJ3LY4jA8a6xa3zPPEvkdBChYiHqR8r/5gaj7zKui/MDt96
         YaCMvilXLhOt43/8Faw1O3bAfbKCfF7sSrYxMStDhoYhtBs6hv4HHnm7Z2wzMAxMBgvN
         FRuGWdvIiCu4qKhQFfLB8j1v7CNsMsgw+Xfc5tnU/nMv6m9kzk200GqhPQtPp5SpTPkA
         TaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479667; x=1780084467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcJPHaxHIA1QngimO518kdxRKpQYY7oqTYXRYDZuXK4=;
        b=k3N3jnNoGtW6wvIBgKAqaRy2ieJaXUDGkYXE+AXZysEaVlBF7KeAPiJ2mKJCCm3XMW
         aPM6d7VkFuiYSvS6nByFZufY+DCOdJ5UuJyE02VWOj+HFIXXdl+5KlO6KLJWPq3uDzgB
         QKe8N7MeH4tD4mgmMQpToUEi2s2y5FuPpAlbSvgkIpztG7kF6Zq/uRdPbomLe3/dG/0k
         wloCVDDQepuPTH5yNdPaZKtpYZzyJs/V9V7uQ3QC79PtY3KGGbZ8ikYtLmVCfJPcOdAA
         DkBPnLIDGyBU+wWHYcfD4s+EuR9Wj1NrEou6EN7pO7xfCVc+LZSE51nnGPnprnDEow3f
         S/RA==
X-Forwarded-Encrypted: i=1; AFNElJ/KBH42A/kf1sX32DQugD2IBIdj2gnbyJfPKU5RDczZmEjLsbInEV04tl/3JB73/yyfI4AMuDFSLe8u@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0rmqveS16JORiJykjuKEIKl21OOAncdhdMcql9ESJKGN2+Cpr
	h28J/oQ6NlT8bBqRM8k5DvX1U1Dj/i1bCCNauW1E1huNOUzUMAqzK2n5QijKAN7hwNLQsLhGcu4
	s7Mnml8TSBIA3msmv7P03XmF2zzvfmKdGcEyXYhAdcrCzdmlfsJqyZHTE2QoMSFys
X-Gm-Gg: Acq92OHhueGYUBnBa8e5q6xVjsTdIXOMq3i5ZewehSXCzptoxOzDPe9qeDXsgVH2ZTe
	jxFEFgVj+yFkDUcax+k8g6evs89mjMcV4kuOhDwlTIjnJuKtbn1MHJ8tRoz1/nt5cJeAFtFE5mh
	+W8oJckfwZDFAPdhKSO9lqzlsw6rnC+1ikcbmDIKtpMm76PQ//+JUugeC8VGN0CpmL/eSi+hoZX
	+SPrKw2JjmlJBcH4GXsH1c68Y2fIuEZ7OdUyP683peHVtN+dd888R6TxTK4O2gsMWxSDHlFXQHy
	xgQmefWOM5XkN5Mp8ZXtQTWsXSo5GRD/hTlUUhKyfsFWWmn5OD/W4THr3R8N5I20vdPq37guT8M
	RLs+H+UJZU70+jCK6cmxJFvEmLprrUC5VwDi8CjEmqc3dpj/T
X-Received: by 2002:a17:902:f603:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2beb07b8947mr58130095ad.21.1779479666774;
        Fri, 22 May 2026 12:54:26 -0700 (PDT)
X-Received: by 2002:a17:902:f603:b0:2ae:5629:ac55 with SMTP id d9443c01a7336-2beb07b8947mr58129785ad.21.1779479666146;
        Fri, 22 May 2026 12:54:26 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 06/18] arm64: dts: qcom: sm8450: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:19:57 +0530
Message-ID: <20260522195009.2961022-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a10b473 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ih2dppi7jw4BXePuyMoA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: OOaiNCPmvtnVid9kEVtzDMl4HKfz_mRB
X-Proofpoint-GUID: OOaiNCPmvtnVid9kEVtzDMl4HKfz_mRB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX1yZwnboj6zNA
 mOu8QKUtDf6XnKwUwbxdJ56q+ntpkNg9PHeFXerLI3RwV+wy2YLyYeN4ur2DCSVzA2JSnqDq/3L
 yHfFj4nPff44E0hJzjdGdiOKzHSNnnhZpBgkuA8T6+GGLXR+TR3vs6BAIQ81fJNR2+FE9ADvtjx
 3RL7vZ0IJpaycYBOlmFrT7jP+2aOPxlc+J2bmxLQk3bks87ATrRRKIqyDBhL6fLa/3lnO4LYndZ
 YVd1twx9Mz5kk0PoYzYfNUNGnG2D5cIztI1ECTYx0Toj+DzhS/V4h4XZxnBkmKtimRoyLh2ECPI
 B8VTKOJjICSxuOPxQQJXVDnz8dSgUNZPM9S/kQyh4aT9HMlHALT+cIFc7TuVf8o6rVrOCrxNK3z
 HFcZBRuXYKDiQB6vYI52I9maIXnsXnxhYqnoMfJ1s60J4w5+iK1aRrPNfm1PDb1ezERwU5sUvXF
 XKJRn0hfAa6bZTGeoyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index e0c37ce3042a..d1fc5ef63a78 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -479,6 +479,7 @@ scm: scm {
 			compatible = "qcom,scm-sm8450", "qcom,scm";
 			qcom,dload-mode = <&tcsr 0x13000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
+			sram = <&minidump_config>;
 			#reset-cells = <1>;
 		};
 	};
@@ -4978,6 +4979,10 @@ sram@146aa000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			pil-reloc@94c {
 				compatible = "qcom,pil-reloc-info";
 				reg = <0x94c 0xc8>;
-- 
2.53.0

