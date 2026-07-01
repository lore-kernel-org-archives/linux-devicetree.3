Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895BB312803
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 01:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870876; cv=none; b=ZBfFY6gROxsQTtfZfl0ZkhEW0c9L/ddYu8LRJ6QK0FVnBITR1IBjIjWGJOhI3bvFgy9bJoSclX+4d4NbpFXW+AbJqxzNRWYCZuRw2FjO1fc4K5yIX8UepxUV62NyqHXPkWxkBRYnupbfrQXDLxOBcplzKOz03uKC3DyCmkA1hRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870876; c=relaxed/simple;
	bh=UN1+XndgFoWu6KIBACkmLA4ik7BBH53rNgnE7Gg8Qy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R95OvLg4EIxP/8Y4/MFI5z5rVIYe4JzcFEzIwrIqDQhjisJjJdes/sxXFWvCmgmuFEEncenK//3kkxCSVBnjCu0FXRkZSruXCwdr3AOsyTBTb6wxqafCcNOtZkNsrNbY2VVAHGqfbJ6FcjHRmG2GhFltjI8IId94ejs3nnFhQiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d1HOLFYH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kDS+4cyT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d1HOLFYH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kDS+4cyT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNM60Q3407944
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 01:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=; b=d1HOLFYHKrEZJw+P
	E5L3IQNBM27NpRQ0fmE7yrUopMV5tYTqgjimzeQE0vcBnbkv/iOy6x5wo3YkaMAz
	ewawqP441vut3ziMLmndYzPXC8A9g3oFTpu94kxjCjQ2nz0oFqXgBmt8Pb/4E4eH
	mOQk2m2cRJYrLNOLx9DfOBirQzemO5hVMESNAPJLiH+oKKUuD9Nrjdo5tcyLxrsb
	n18eg7KIFtTuL+e0QzFZxETJkb5DwjSKKSy2KIAFgu/w0IydJMlAiNwfoNbA/ol8
	LLnB1z2etT397kZDxv4ISmNzPdq58x05gg3CLKyOUNlHOARHn8KZlIBVL6zbw6SK
	g8DNxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3shgh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:54:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c81db324caso1852335ad.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870874; x=1783475674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=kDS+4cyTUauA6sWmBsE0O9ZfFq17CGM2az7wrhkwhjuANJsCzyrhzHN9Y3MeIfyMzd
         K6zu0dEcWgzWTNtFBSwrsTl9mzCn/IJHylG62kqJE5j8vo7SsAuYb6Q6E6p1i6YW0Icz
         1mU+2CezXs7P3M5ppNB0lel+YnG1bMRNaYg3C6HHdbSbarPY4feFRb4XjeHqc2gc9Yeu
         oLHyVhRJhxsjUn7b3fa8dnu1vGTEDX86IhKiYq2K6Oyy7TB5sBCzRSyr4f0ayYtW2e43
         AHm5WDKdG9KZusDpFFZUpGlkmakisjYCgdNw0kmmmXWg8nJJRiWeRBCb6EQlVhfTkEHl
         K/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870874; x=1783475674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjH1jV1M9hoGtGfFOL3DiSQcmeoiGuojoUXT0ExAk58=;
        b=Re/FAY4L/Yidxz76OhZIVUp29DVqcXJviYQqUNWqKnM9yLbl7aYJQqMidnx0v3eUEd
         98hgZCWMc7zT6kkLi9uPqec0jY+54zIzY6UjnArB3BtVQMfcGi9WzIjO6wCc5IOgTtg+
         wgE99jrN2UBBqTzFIoVm3AUXfQsSlQeIgODhZs3PKebiG+qnzcO045andSGFLnpQMDFz
         +zY4A6/N5viotaQW0GPetUJv7jrZ3fcbZ9AxU+xudLGSBmL4NI7mUD5bCG8wMi+AUTze
         fiFAxVI7xX3Q3XMozu84UBS3EX3RwQRA1Y+Uc0Fm2wzb9yovfpQ7l/eW9Gi1FgAfqjF3
         ZRaw==
X-Forwarded-Encrypted: i=1; AHgh+RqeD3mqj5mDtAV+jWOdlQ2UaQ8T/cRQU++2qEO5+t3ox1q+88pJUa82DLpD39o6pvODNQZRW7fC+7q6@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoC4seghg0eX31s4M+XNl2qcNX7vQ8yMRkR7acBlYfGeVr3lK
	k8W6yEGmC2ZZC0bu3pkXHzWUgAaBskwxhWRG4u/3+5j3pdq7ddZNy45prUxNG18cl6AXthhEqrJ
	OsK7u/3UMhQSQ8mEehOXJm4Ope6GX9pUnSkRhJlZA/6oiLqU/dQTJPIlwpKEvLIZi
X-Gm-Gg: AfdE7cmbSaRfiYlKS1f3AqKQK7zKXEdkrXzGr6d3p0HUwsPrWx3S5ffpFtp8oxGvcu8
	NeK2drJIO53yvqNN4c1PKAUzqsbBMCQtKiFEB+arqJaU1+2cBU4kjKhT+qrebV1fgG0hMMQh/ad
	6X57w9/2FvxqqQWAnjRGtQ4nt0IjZqEQGUS5VUAxAYTGtyiQs56Fp7HAoG3VK3U22mhdB+sgg0y
	b7xOrOGhdZ6FF/lCcw/1BH2n1EYmgAEoh5eJghtIhHipHaazuo4HF9KE7/wAb4j72Qz6B3G0L6h
	z5X818g+xa/ukr3dQYWp3zdJFFBwbF5Ko6hcTtKVdaGiX4Md4IktjIjiAuKnRB67cDHPik+QJa+
	WjDde6IJeobJDU8kpdcZdN/XGlB8kVVN28Hc1Osynt7z/Mv2OzTLms0GmCX8swDYT30+qKA2qsA
	==
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52741035ad.10.1782870874042;
        Tue, 30 Jun 2026 18:54:34 -0700 (PDT)
X-Received: by 2002:a17:903:2448:b0:2c9:feea:4e50 with SMTP id d9443c01a7336-2ca2d52e930mr52740725ad.10.1782870873570;
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:33 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:43 +0800
Subject: [PATCH v4 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-3-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1646;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=UN1+XndgFoWu6KIBACkmLA4ik7BBH53rNgnE7Gg8Qy8=;
 b=sbrpn5D0WoIXPJr3xlIlgYYxZwy4hg09s34OElU6B/9iYKSPMpySzLDXd/hCsG1HtB0ZU+xsM
 Ni6Zc0tQ2r2AZ8fDB6S0i8TwGjUtr8JQhL/FuQGBVatYsLakUbb5bd/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: QSLW2YK7jgOawhfs4miBaaLBudfSuO4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX73Ho/OfKQ69S
 KukSioOv39mJSxKhYU0hLedShn9KTtmmKris/el95HtrXns7IuYqniVl2HBAHo7+hT3wizTEYwg
 WjO6Ip2w9nfXTbUSy4Gz6zxX9d2VfQqW0Kp5s8D/j4OOrzCfeATXyWOPtgnzcAVnh+uv2ZreG2x
 2LTaOSYt+pj/olPbTUbSl9iHBkkEE/3RlNG95DWRsVpIxhqE0xKgPb4MDSGeSekCxVwVVh8c15D
 ak59+Yg2GlBDSd1JvuNG2+FvF9T8u3efbeSVMkXA6fPxvhfpN55VjvcTPjN/bcKuuc3/WSkryWB
 7J1NuWBZ6wZeL3mc6bKhDmOrNTsyp1YJrTozbZ+7ZiOsymhEY43H1CdknD+ndAtfP2Fqjw4AFKs
 CA8Oy+5gbEJHUcddPPBqCkaJyuM1ddfX20tURR9P+KmTKDFZHQWgVHcfTx3zDnbNaEhuXYEHgud
 4CYnt+AEu6Vd3Dcikow==
X-Proofpoint-ORIG-GUID: QSLW2YK7jgOawhfs4miBaaLBudfSuO4o
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44735a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX7MEp3aUBxgiB
 Q79GmXWHlbrGBaqAxIuA9OTDUt+vcvTNE8JzAzJtsNBA+jGUMP1pBLjsOshEm5mk9s5qz6k9LsD
 YT8kW12gt8S1GS57xZTgXoZ46420KFY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. To bind an AMBA
device, the bus first reads the peripheral and component ID registers
(PID/CID) at the top of the device's register block and matches them
against the primecell ID. On this platform the traceNoC does not expose
a valid CID in that register, so the read never yields the expected
primecell value, the AMBA match fails, and the device is left stuck in
deferred probe indefinitely.

The Aggregator TNOC is fully described by the "qcom,coresight-agtnoc"
compatible, which binds via the platform driver by compatible string and
does not rely on reading the primecell ID register at all. Switch the
node to that standalone compatible so the device probes on hardware that
does not expose a readable CID, while remaining an Aggregator TNOC that
retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

