Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D975137DE9E
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779479689; cv=none; b=hT6m1JDxuNtXwLEcuSgEwRUF+OxrhLv19tMe0tKfQub29EBkdGfUo4tZRI6kTmpwnUYcRacJK0Vg7DbhQT7uc85/MFEwY5VcD+uOyXeXijnLixzSbeK4GeA0+CdP+vf4+RW1pj422rXImOnueQwJJ9q3+8DstBoSRwPBBss4HCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779479689; c=relaxed/simple;
	bh=amq0ZbYpF3TaS+9zy66LuC0aQiC4BW3YaXzcg8RvkxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABUQpViGasNhNsWVqNIacDoLmo9v3+ZEejY9CokO1xrJ8cNW+2F7GN6euPjP7CIWXtltXquaTZmCZAwZ47/AHia5YwvwaD/3v6SSHIUQ9ex7uKZPAL5WmLUFCRR8lL5kx5C9yYWaEIvrwLJwfZ7JLY7ZNfxtA9vgQZvCdILZEYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bhCON3+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=khvjnzQp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bhCON3+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="khvjnzQp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MDpVJ62125149
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vXY5rKiBwoi
	jJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=; b=bhCON3+G8KO+YfS1CetZ7tMPxqx
	w8HrWiwQP3OAC7nG2IA8Z5BCJ014yJ3ggs0E3YGQ0qNl0tyouymWB++jCdzOM1mn
	CGJHG8NJsvpzT0/FX+IW6g0QiSibi+xWV1z+bJoehLGR+xTUm+9z/0iHVTnI0x4j
	PhEKCBO2eBr+/tspUnQUNCxf/gZe+u9tNzl/07M2nBrIFImr5AadFoimK43N3RKI
	a2OKjXGP7opJmTln4AFw3gYmdXi9YpBbpS6pCEf0w32BimSSqfdGxVJCAnvAjmoD
	5PnHu9FKUFgp4JunXXXg/g7DELepJ/9kkuz2dU43xw9u1FnCJJcsW0dg6+w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eard89fe9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 19:54:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba5f794825so60300175ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479687; x=1780084487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXY5rKiBwoijJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=;
        b=khvjnzQpKZGvsoa/rsI/BdIdd1BMF9rJjqQFY1sXOTrdFk7Rr3t2hsGfGnEiJ64baV
         +WDFgiUGDWpZmFlVLj+dApLFMfLudfTj1p9Vda9mRIE92zAcF9aKC8yMwxjrBM6muA2b
         TIv1EOGoGRk3E1kLn77N2mp1nUH0I3LK7ihjDxtUDstr3JKVuaEOFx34rB8DYgAo/jKQ
         ci3LYdK7+fIH7SvYX7fA6xDxPlBUT2RNqFsiLIJC/tv18Djyj7+RUBaESYfnxI8iWNeB
         kA8TucMoA0D7M1IhfLr7BV151/JHMphz1igHze+6id0JGIT/KPx6Ggzonf2uIsX8qTlh
         NrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479687; x=1780084487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vXY5rKiBwoijJd0uYXGkLB53jCJA8VoI2wc/O5Xwf+o=;
        b=etriPCFRncooHaBQYMtmTHt+eDZQftEWko3sLNPjnfDw/mx0s4c2futxE9p5ZCDsFN
         p9xylbQgog+u7DU/jO+UOUzDDiBLhbq2/dSBEd5fXfJNxTGEeuNLiH2rUUvhfh79qJEK
         3xVuxKEOMiEOLAOl6IPerDG6xGIxDn7YdyMNnSaz0+ekVok1+Y7V6S43RNEIvIbH9vu+
         wY0bwpM7x342TAVhwBarE5iDU2VMOthLs57mLdNFZuzt/Pz+Bw5hlnJPz5YnhZhAMMnI
         PUM5Om1S4URNpzOjNhfLSI3IKz8YHTSL3Krg3jYS/6NCPMLqQ48zTE6spYMLjjH5Tr2E
         l/JA==
X-Forwarded-Encrypted: i=1; AFNElJ/808adU90eK9dsKxel5QyoGFbc9iq4FQ5RA8qv4JfoVjvzc+6KK9wvc+llzC6xJHCcXR2ar4rJzFdR@vger.kernel.org
X-Gm-Message-State: AOJu0YzU2yW5CQMsxOezhhcgq4Dyrm5VtGFAm8zdADGvf3jshFMXb+gN
	e9cGF7JsOJhqLiDyzub4owL1vo9+HHrbTKWIyCmiRv6xrqN8jaJ/uq2Np2JqwVIEQTmCRvOb06E
	0kQBFz/kLbtTV1+ZtcahQJqd+RuEpwShJs/vLzwA1AGNAX+w1t0x/gUohjx9a6DZt
X-Gm-Gg: Acq92OE2Kwu2VoKiCpEKBWchFIiL2S3CPvFd9MMuXf/oQEFcmvStjvFpFJiu8tPeh0M
	RGMyZ9mzqCgx6eKM9U9J3zZhyGGxuSWWlBKwJ/jNev4L11xZoFMLOFqhUEZrTt5twHCavJYzt3L
	DTR/y70nU9CcwVu8+wHMgdZvK7H6wf7lO8FO8v7BqH8Tn3JS5aQMyofnwMNoXqsoyZK1EnsWig0
	iNyAx1qmWGowItxOtd0hY3Z+oT2Sq5RrnKeHrEpMvQKdzWXjryTL5gMLyzWIG/zgUK3XoY5wUeb
	VVKsSJBw3iR3FF7jg2GJdYP/bUlyDv7cCW5SQMOWUcKfQghKxHk5EmR6BmMgnI9rtyObPH96vVu
	e/BcwJDNFCoCmRjw4KlleAnPryQI+1aNFcxgj6xJNQ1Sv5d4k
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr50964985ad.5.1779479686519;
        Fri, 22 May 2026 12:54:46 -0700 (PDT)
X-Received: by 2002:a17:903:3c6c:b0:2ba:6bd7:8f00 with SMTP id d9443c01a7336-2beb06e9eecmr50964715ad.5.1779479685972;
        Fri, 22 May 2026 12:54:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f05sm33541155ad.6.2026.05.22.12.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:54:45 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 11/18] arm64: dts: qcom: sm8650: Add minidump SRAM config to SCM node
Date: Sat, 23 May 2026 01:20:02 +0530
Message-ID: <20260522195009.2961022-12-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Fus1OWrq c=1 sm=1 tr=0 ts=6a10b487 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZJQsJAtiAu0WCEyc7p8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bF74vIxQW3eMeVUblGrG3GBb0thvw88A
X-Proofpoint-GUID: bF74vIxQW3eMeVUblGrG3GBb0thvw88A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OCBTYWx0ZWRfX4ZcbsGYVl0i7
 aGydHEQDMtMwadHj6Q6vTD9wXsyCeY0ntNdKJ+q4NbL1vBptT0Jvp3G7qnyJCmPsMxqfd8WryAK
 tggJzowFQ4uHYOif0GAhZW2iYaI17cLfe1dcb/4vuCm5mm4cW5pERJY5SBOFfkww8V3xIAmrQ+f
 I3g+VVHgrreSWQrpryKAJ1wlOhVOg7QBHNLZmayLI8r+K9cpW9xVntb9F3xDI47AgzrvDRrdsKq
 zr4FH+wTVqqfwTf3X9KlNkJcyn12QxQce0I19JJuP2+DIBjhEq6jglHI9EOY9tbBtwkKcrSUxt1
 svshPVzbT73zjdfubEviuYrZ5CyqSpb6Pf0edwpJ11vkamBO3rhxS+VBKhxZGkraMb1YjAf8GSo
 A+OTcIj+0EXpkcSnyCATEumyc2PyQMOl97yEHepGXCg/vzwus1P9vqOxBqKJee7Y5pzz6fgef2P
 GJ7KyzsNx5tEG6sHwAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220198

Point the SCM node at the minidump config slot in the always-on SRAM.
Boot firmware reads this word before DDR is initialised on a warm reset
to decide where to deliver the minidump.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 1604bc8cff37..cee4def3c51d 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -645,6 +645,7 @@ scm: scm {
 			qcom,dload-mode = <&tcsr 0x19000>;
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			sram = <&minidump_config>;
 		};
 	};
 
@@ -7087,6 +7088,10 @@ sram@14680000 {
 
 			ranges = <0 0 0x14680000 0x2c000>;
 
+			minidump_config: minidump-sram@1c {
+				reg = <0x1c 0x4>;
+			};
+
 			ipa_modem_tables: modem-tables@8000 {
 				reg = <0x8000 0x2000>;
 			};
-- 
2.53.0

