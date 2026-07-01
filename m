Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54791361DD2
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 01:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870884; cv=none; b=BPqXvOzRRp97zqYluPfKxCp2PvoJlUV6ScRJzdO45OhmuV2riEoe986K5vhKPf/1lcnaV2mPu7pubSf7eL8bhjIGpKN2bwd0nDZvUm2QIhX0/bxvbOZbLHW04ISvXurtya4m2jKtGNiJopG9fHpT25gUGv0oodPAX9dN+qBOlVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870884; c=relaxed/simple;
	bh=PCET8Oqhsj9WNLCZ/XUS+HHH9XBuN/KDsAhmhsc1HOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8YDYmhxfCKiudFIq6qiyRLvQcOpKs7+LhQr4XYjMkAd87SChKlTRvW/1vaW/GyacOMWW0Qel0cVRtsprzY5INQcI8G1d/ZsHolDAYrogSa3KCKu8gIR63CcDaQuGG2DlrG0hUJ7cEr0IhyLLRyxR2pLozMbcVAxVzgV/DTvm7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SQ5qtVv3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bolyOKfJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SQ5qtVv3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bolyOKfJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNMMTR3485225
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 01:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=; b=SQ5qtVv3XpW/SIch
	pQeu5JdIX1tXVwF48G4I8+Mx7/OLY+HFraq6gOfd6YqBlgrsfAUwDe6UdlEE7HoY
	mifnKO/nuvYh25lrycu0bh2RGqxRBVJjmGQkgv4r8S45dSfHgYK4tc4BHo1y3W4c
	qsGSG9dJU808Tn28BkZ3oIUxVSlOVzToQmB9OB4ZxYgbhsNqlNhxnCLoFKxb3gOb
	UQpe/UKyQapTQrJ+57UTRZZrY+LkmDco18MIJoTt7J6GnHR1trRvMlEbgJjzdj5/
	vF1K3AVQ9EX5kZE5KxgRUxgVqP9KnrSRLE39gDOX7G/SElpX9Fb9ukf2a84wE/zr
	XDUUNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0at75p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:54:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c80f89b64bso2491315ad.2
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870880; x=1783475680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=bolyOKfJLyg3Jncpzh0vEGOehtDhIS6Ns2tNYj9n7RT8+vr2PLaK1B7NJDxCCxxpKo
         dTpUI8mKRO4Q6Pauyru0bZqwqsMiuJcWNaaFqafzPpx2Ldxo6a1hMSS3pCZZBaQciAtq
         I9ae9FG9msE36fA/QIzb9VfHK6js6IqZ0Y1l4on4bLMkXdGBgEuLHTB3mdrBWhCMJe+5
         x2Z/JxtAquHPms+i/c0LMjWicJt2VO0d0inXhRpfwg83F3y6qWfTaafPQPibaoCMsBne
         29wY6o5SOR+gOQHJFhZRASWUB1g3lg6NxNZrwY+eOdyAQJ85MiQmzVAZVrhN46OV/7Sb
         PnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870880; x=1783475680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YUQmXiEeanjlZBxkUO7Cw4KiaDiV4AtcD6I1eZtiG8w=;
        b=l1xL7rhBrc7s5tjpalS2NBwD8FJhR8sBDDpu1OjvxCwT76Oe3Qp/uqynjU3GH2oupm
         /7G3PWYJ2V5XTLTkJjYjyY9Jv/QlC8NEwEKVxBGJZrVOu80S6XDq1nzQ+z4h883+pm4N
         2ebQag0nh2b1bdbQksY0FK+oDRecz1l1lSu0R+qBNAhbApzRmQN+f9Uv6g9vOB+fnqO4
         mrg9U+ESG0WhNWiMlcnDPhLkyfPkv57FsSnVrwQRRMfR0o/+3JwHUl+41acKEbD6ngrc
         xOE2AZ+xo4xHeW3kDHppbs/ZXGPYwdcUcYH//gvwdwQr0DTFZBTbQuQnrIWsLDrTubHh
         wJWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/V2xBu7em36eaY+yxhxFDno/XxFSOCUMR6PaDq0LnzppA/GVytRXOa+/F1cKGNp67a1/737yo+9rjq@vger.kernel.org
X-Gm-Message-State: AOJu0YzxE1sl0zQ75FsyTLJj2JG3F/7o3H0lqG2c2h0DSvFCjLVJMukP
	RXmsjDxLgpk+ZlrVRYIfygHDRbgVKFtD/JPtFp2UBBlGJxr5AqUsZ7Ym8setLlVERhAgyORZCYk
	QZxOd30fnL1a8dTBxmWWYrI79ghQk5x/Xp92P47rBUkws4NXJiAmunLOk41Il3mtc
X-Gm-Gg: AfdE7ckaXApICLVppiVi6QY4612b1wQfKlJ+sLbDej5f8lRxw2FdTAszhVotbIgVD4W
	Qv50OQaRg4+nd17lr8oydpkbTLTbks7nt5zOxeYVe0Kzj52U+VcrlAtdkRTsPUBSeoHsM/If0Ue
	DHJK7fOB4qai/pVrucO8i7oeSXMcR9l6TxLB+6r6CyWCbuTMulfWwtzNU0gVWfC/GK54zYLuLlj
	3ang7h6JWd1Hr24iatuW3VjjZcQzh1PVv3Op3TvWcyTy/oGBtrSBLYhw6zEut+Oh5d0F07B5xks
	3rzyHnmX6DPq10d64IZ1saFZ3vXLgzvKQTkXsL5KwcFCOcclam7kXgwe25h3897EUQJ3NqxtmnO
	xS4JVX11PVwy01GfX/7s5wViXWgIQ/VdgXr4yXYSUkzF0PzBwqDtMg2MsLoj9Nyl/5x+aQNDw3A
	==
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47446265ad.21.1782870880352;
        Tue, 30 Jun 2026 18:54:40 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2ca2d56ab0fmr47445785ad.21.1782870879907;
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:39 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:44 +0800
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8750: fix traceNoC probe issue
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-4-aefab449a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=1628;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=PCET8Oqhsj9WNLCZ/XUS+HHH9XBuN/KDsAhmhsc1HOE=;
 b=YKy+xllUw9RH0izO9EqIparMC755sqafsp0VAOQ5ekC4jfS4ZNDSjscTf+3kw/y231kgg3C8e
 3fhvMJA7yZMBjxXVyYEA7L6jBAJg644X6v/W9xfks3a/UgSflNtw0di
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a447361 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5VkFZXXe0QlYWD9W4eUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: lev5O0mR2lE1sJ-RqUv9PU6p-WsCXZ5F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXyYgC4ocXzQ/J
 5+XCRcFiz8dRrjnUozz1zGaCbR4ctq9SoXX2ZhMdrKfSUU+MUVW1WVV/XMfMCNfrveJqFccZzQw
 W/8GxsySQ7xmXHDWvmvReUgw9XKw0FU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX/v1sY2yMt40e
 n9NTOa2BSzch96zmZ8zFiIGieXALmDpeYDVpXHx3KKz44Xb4lBhh0tHi06/TJ3V+Ddu13IgidGJ
 afuznSWyruozeIfHxXECWvxcYPK+uM2xqNrzukhmHa/Lbha6mi+ftJasTQxC2m/xyHyBJVKNeRQ
 CT/uEpqmXKk1uxaFEkJvlY/jniNllWYilr1T8bRvH+NLcQc7KEDB43gRQbv9XQHSKmCS/n6YZaq
 P3nMbx2FvQy8QWFLk5qkWdDb54wTQp1n0CKWpYKVhFW1e09xG6GuRPv8GukN+oBH92O2bQxM21P
 DBLBvKstX6lBbFXPpXqR6LDVPCQEwETeO8HMjJ2y21t+tu+147GCKvEAWUHKtbi58fZTG/dO0s/
 0P+mOlB+5i9tfgoabIj4fhQqYRKtvIrHLpfrsHsb+Zfd9bmPxn0jz9wWdoH/xz8L9oVPtD+Y+r0
 Ov7Tv2lwnDKczVZfI9Q==
X-Proofpoint-GUID: lev5O0mR2lE1sJ-RqUv9PU6p-WsCXZ5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
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

Fixes: ebd1eb365cae ("arm64: qcom: dts: sm8750: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..d58483f9f93a 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -4687,7 +4687,7 @@ tpdm_rdpm_cmb2_out: endpoint {
 		};
 
 		tn@109ab000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x109ab000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1

