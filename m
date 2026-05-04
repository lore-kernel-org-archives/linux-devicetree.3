Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F63E3D91
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914438; cv=none; b=Hy9bFfDa2hl8DluD0L6VkiW3M2e36bS1K1aoi63FXkW/2wgmCqmLObtX1p9ullk9BITLobPgnXXz6n3CW50TQhmPUGclFqYeXrS9+Lwjo2nlsW9Ti1oMQ8/8IE6fuaZsRZdRPMD+mkCM0S885teqpE0RQylIUHeUfanKCnvsGN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914438; c=relaxed/simple;
	bh=FJZo0Et9Ge7zPzweNtmgpx8X3VvZyD/yo2q6nwgqe48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pa3BEq2tIsbnTaGD3cCo1Yt4U/c1WmBDyHr1RlqQXbItLDm77HMdoNWv6gXY8K3LFuqPLzNn2y6/Cs955gtvkJZxFVE+wwJsh/ykLmbBw4okq6b2d3aApIoGxK+z5tksP6mISi/NUBmBOiRAwAD4Pdr9UAOCiqU/EaWmpvyutGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ReY+r8nM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+Qds9yQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ReY+r8nM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+Qds9yQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FIUpu3409245
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 17:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7Hcpw6i2pAT
	sENpryDxAQXYUopirQwywsIEKKqL0g/s=; b=ReY+r8nMq5FtN2czRVMgeCUSJyx
	cALaP7MCrcE8uep3GFh+EILEm5wTgc8kfz++3aHLvvTWvPG+S+uZEZTF87aM6B8S
	e8g/NObeyViXeKUt3PzfskSkCvT/foTClziCApO9Y9Q2gbHMgUQNepbSWwAyOHI6
	j8eLIU80Ii4XTMgDfoh/hXqrTewGwHBiOjlmTNacDtjAJzNv7B/TjGKCodbdQr4p
	taIBes+WIXqHI8bCtYdb48G2T/YCiWhHimVFpPmdtEbSHd1iNNo5aZv+JS071biO
	1JLDtVl08MBo1QXw8o9m0swUb2IA62cYs7/gjxeMIeQp6Kv7CWZnCZXJ9wA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00rddk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:07:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365290bc5adso895092a91.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914435; x=1778519235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Hcpw6i2pATsENpryDxAQXYUopirQwywsIEKKqL0g/s=;
        b=P+Qds9yQFevlFlCdWl8OxF9t5MRrwu79RtXUPr141EsYs9J6Itjpi8RSLoIFiLaWeY
         1/9E+SBQwUApahADn43DZKPEFAKlHZVfqB70sJj7jr/WXt6y+1eyoihxSzRFPIfaVHj/
         +avlVDC9+2zUAR9GOpqRr7lFByTq9P7wV458HRHDfdU39wk11V1WFCR1BPs3G0xT5PuW
         QN8Rm1KgXR8r9upDPsJ+n64CZbYLf/D5x6eDo+fylDB9GSFg4DETiS8Km2YuGHWp0uUW
         7Dq+jexZRJte/3f0M7ABxwQRV8zk5qznH5pSIjINNe5zuyMo/jrfchtknxaJgvs+zNwd
         po+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914435; x=1778519235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Hcpw6i2pATsENpryDxAQXYUopirQwywsIEKKqL0g/s=;
        b=MRQgDcSWdQ9FL7Rbdrt9RPUvB+c8GNByBcUBFKViGr3rNKPRAKv7Cyc8x2GMc8Vqs2
         qjr9QKTVNZJ7YIXV8zWt3hEkN237KBbkpSihgEQzDBhUdUUW6b4lRv8ZcmRXaptJWTZR
         TiP/RW6FI0n1Akm80vWilCSWyrGUS4vJEgJjLN4hEWa1z6vMGtYdgmLz1QufjNgl+xrn
         LT2QBgikyheGFzR1I52oGaD7+bUhZ8HzSBKal8uqOH95D30oUz0H+69ELOpeDZYdT+yd
         6N7rhLDBbJzCH8wLpcFQsa0LF22hdqpCXTEC/uUdyEk9NgxiUqzV1zNhQLjcPbW+Fugg
         gz1A==
X-Forwarded-Encrypted: i=1; AFNElJ8q7BZiBRI9U8uKBzCz0WlydjyIHWw0QKE9+l4nDUZ6DHAnSRWcRRdQ8UScp9MAMKVMgAmoq1qNEI90@vger.kernel.org
X-Gm-Message-State: AOJu0YzllBFkYGieyg8N3PcoTv/jsIGZ73wkobrc+ju1MYJSBJHJAxFF
	pzyYc7oRUQzcPdqwg+AYkyM0+tR02enqlr4MJymZ3GkPck/VwDzU7S35uONodwFJ+G87xK0F/Ks
	M74j1tkdxM4RESSlptuCeoRzwkKmvHCv0a2PxxmsXQ90lJ//EG+oQf1ytkFF1vtCr
X-Gm-Gg: AeBDievhQ4ONdjjmI4RCYuWl94FXzaImOb8Gru9ZT9bFSpIwqlW9uyL901wS+TMnDBf
	lwF1DAQXHT6DG5nVVH1ndECkMDvMGkmFDQJwZdoeSHIcsEmbAQdRrgXmUzrQxWyGvQsEU2eDKGc
	X8VZnAHFJ3aosqOG8f4GGUGq5yC06yhu7LyY5weHWw5xi8RQ5HUmTqL35qZlt+LUH6e0ezBNlbR
	okrCgicSPxg5Ql85D5+VcBGpKDXN5HibZ1H8FI6INvFiHq8mpqRzUIDxIz5JtCso67yIKJvdPIT
	UmHOQxpG1kxGTqaoGuF1C+mlfrsYm7+sCm6sq5Ln2sBMDkBQciAxhP6eUm5fMPwW6aTamdDvqMp
	t24+7kR4DoKGsXDkJLdxVhpo0/9WD52tNM3Q3VtrX1DQd4LqNxnJv4ZCZTCFNEqcCNhOmsjiGE+
	uDGQyJoTz6ToNQKoOe8eMIXUzE/w==
X-Received: by 2002:a17:90b:254a:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-3650ceecfb1mr9817630a91.26.1777914435237;
        Mon, 04 May 2026 10:07:15 -0700 (PDT)
X-Received: by 2002:a17:90b:254a:b0:35e:577a:73a9 with SMTP id 98e67ed59e1d1-3650ceecfb1mr9817583a91.26.1777914434610;
        Mon, 04 May 2026 10:07:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: phy: qcom,qusb2: Document QUSB2 Phy for Shikra
Date: Mon,  4 May 2026 22:36:56 +0530
Message-Id: <20260504170659.282532-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f8d244 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ybcDLLt5cEg1GZjoCqQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX79ISl9vSAG5Q
 msBMwFYUyX4hI2u3Tb7+Gpc7BDUAFnrrBMkuOy3bDa+3ROB8KVa0V6iuCTORmppkc94bHUWlvCO
 YPloV7SFStgkJBSvkG+kw/9hhHoGoSY15DUau/9hrdUZ2PjIywb+gfAv+n7Y4rSqxjKByZi1Sut
 DtrnwtGxNE+gcqeCaBtyJKCElkqu5cYybgjfvF58fagdftHR3kNFKzaeZMAAtrIy18/BQR617C7
 PdjDmVa3TIg9Cf70tJ01BXW3geIYlgx82/LYYafyVwmDrKB/mpkOYkCcKX5DLbLHQ23W88AHsYD
 jxI4FNSVXUTdovGPvYMBiBwb8MGOmL2+6qs1InTJdgiu2Vf0iW8uLx9J33D6Uhwvc9XQ7teaMNB
 mhRc8ZKWXsPpOJWNzcW2HmgEzJIuU4N//IwFEnmJbYxmVL2k8tr6myG4jXizZWlqb4TcYEzHuu+
 GSCbI827IOhif53tS4Q==
X-Proofpoint-GUID: lQsheiBd8Tybkvqj9Kng1Ff4R44j1c2K
X-Proofpoint-ORIG-GUID: lQsheiBd8Tybkvqj9Kng1Ff4R44j1c2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156

Update dt-bindings to add Shikra to QUSB2 Phy list. Shikra SoC
has two High Speed QUSB2 Phys.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
index 39851ba9de43..ddbddeec6fb1 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,qcm2290-qusb2-phy
               - qcom,qcs615-qusb2-phy
               - qcom,sdm660-qusb2-phy
+              - qcom,shikra-qusb2-phy
               - qcom,sm4250-qusb2-phy
               - qcom,sm6115-qusb2-phy
       - items:
-- 
2.34.1

