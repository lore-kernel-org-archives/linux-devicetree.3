Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517698;
	b=P7+04sKyUGXKPx9lp4cBA2MY1qzy0hcyZVV8Xjj3j8Z0EHhK0b19j4fWYTXFo3pBMnFk
	 uxAI+VkaSOCZfiLnDgXo2sX4DvPm005Y2sMbknGhgaFUUUGit3FRBJ/G+Sbw5POjSveZs
	 41cgEF+8toGwUmjeTK0N5PSn8CD4AckXBJX8S3yCS6eS+zZwnLkXNpzIINC10ThOkM1kM
	 drDGZOLZYDZndvQ6Fmi+ViTm9LeLQaRxDg5UZ3zqEtRUi4eIS8aptDYrRIg0/ZOL/IaOJ
	 p/sSMrLLZDV1MvjCnuGg04vFp9+x2xaPy+Yq79oYjDxrauoEolkXIKUsMSiGfYM2eGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517698;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
	b=Cus/R2KnztkGqa1VXnRLLONcOTRecMLIuF7u9x/jP0vLWllANU6l6ujtAMQSsUCLnKkz
	 uQHK+BK5rFt9qPRLv46xzck2yr/a2pZ/CY9xx5iKozzX4suzpbmGPfFHe+oQDzPR1pQ18
	 X0wh+fonSwTH76k8FVPzl/su/ZiwltdkWJ1dpqjBFh6KR/j8SsbH0FpXcd8y4IzcDMpIW
	 neO3VDNjsPAwf5WlP0judYk6wgDegI/1WMzJuHNHct0Gfx1fgoMiJCtbE+CE9AXlq6heE
	 YySVhg4J0aoIdYVakMvz4Efg+ki7VdSmG5QMrCsSOZSjttCyKeGMU7+/UAfHJb8Sl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9SciSyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWfHq3zo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF1606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBAF1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P9SciSyn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWfHq3zo
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAriGP4136053
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlV
	ZaxntVfE=; b=P9SciSynycsGEIVFMS3diJ9WO4pa8LRkuGMtgFBJHgPzynH3I5+
	qTCFBRCgYV3QL7JQaH2EXGhMH/EAbq4P8KRKxDv4MLxn2UvhKg2DFA0/zM5T684v
	ECK+g0s56o2viDWtgTa1zWGb54DXhX6pXDTZc4e6YFbqufxRRpQnxhDSGFuT62pi
	ThfuiXvDL33vawwxEBjSJa9v2p9qhXyyBXVzqFYQKravYzERPlaR0dw3y4pWAxXU
	fy7t9zh1oqJX0Q7AtU1CY7CYrHS6gSl1iBOBul4YMZnj5j+jxoQn5zi61cvEzFDQ
	/KdqMAdBKDor5FG64VvFiZV+IG0RhQt5f4g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rpha0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:54:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b852fdd55aso4896787b3a.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517696; x=1796122496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
        b=cWfHq3zotj/yajFTZFbtj/bus3z/W+mWjslhRqvkiKmv/HhErr3wA2C9zTQovDJfYJ
         nPXe9gYVnvKx0H4fo+ZK7prDOlN3kU+nnTS2Sgublu2WnZ39iSJpjZ6oU47LEKJ1p70R
         ltQa/sfcgh7OSkWlCUUZmdLTPSiKxnvS2J9XVOaJ4vsuqllmWcHOLGIKepnaqhqjn5as
         2l37Du/Nv9LoYJEmFxpVMxPqvOYkb2Y9ndSbKtoETmJ5qFrqD49BCWuLkZ1mTZ8Uloob
         9fhddYhOCx5iQYTMu3x4HfSrJ0r28SxfJRn7whGe2/n4vkkCX+D10klvxDQRiF/+ynO8
         MUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517696; x=1796122496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dTwZnOHLDKXEvNUsrVBpyCfVL4kbo9yWlVZaxntVfE=;
        b=BTFeSxItItqY+HzKCDci3nwM6Q7I4/jIDV7EQJH4R7Ewbevz62XizC3Vpiot3Q4/Cf
         +eUvauiRKTtoeBqBbS6Ao6loL5tfZ3k5v/528sIgcBfsUipdw53IYUqT3JppC7daaIri
         JsRHkvgZaSBHYg2JuJMg70eicpDanix4suV7zBDkubq/Zg9gIDBZYxms1aHtLuQm+N6P
         j6SBsgS1RSmmeWdwhZMlQh7vaUf8cxJG3z07+AmMcunfsogQYHFzelFAS5MUTtZyD3p2
         p+kqpO4mlLpF4Iei8ddcVfhYhufCsUY8mb2OwP1vCCqJrt3eXZW7x7bSSTxj594G7kDW
         tInA==
X-Forwarded-Encrypted: i=1; AL+hErHhD1h4aWWVFkAHJuvMdXmTE5RB8Shyhrf4clhlNt/EMfSVKyiZp80AzL70fdH4hd9ZsxTyE6I1rPGj@vger.kernel.org
X-Gm-Message-State: APuU4Z/h5LrtWeb1QixVbixc8zUDW0Mh1c5OZIpJdS0cJgkDy2mASTO0
	paQF3SShhBao+/KdQddOUBMUm5HpOCm779cVeJ6DYGQTdXckt9fs2UDt4M4FuphmzKMr+FoHwJU
	XIY6ieGZuwqHdh5BXYGtoCz1MHu02kIunkssyNBNwha/j2zj6IKAU8E4tbb8hMWVl
X-Gm-Gg: AZFdTZc1/2uCkmA+wkHJncMQFnqoTQNx6o0CyBQUdAPwIxGOOtr2pCRkbaRakB8g2tr
	XAU7o4okrHjKL+v6YApbD5rdVDUPSotMtos6cgSzpAQYWCpW/oXAk1HEDXMoMuUnN7eefiKFR4h
	zp3BprelIPnOShhprcxhaIKHe8KTl77JnD8UHORnpjfkgrPAvPw1CuSzPj8+OZLacZiHPuSdTJB
	GkAWIKCIVx0UY1i9PEFGEMd6xg8ek95Ajcdr5JlDUVvRr/zxXtS48gyhuKxG7SOXMTHQn8ZVs35
	mphcYL+TrhU+yf9BWhUxcoJeYMGcLOKM4XckiPCxuDsnARkWVPTA7o8sGEjVNTsfuSIIBxrqsKz
	fCGCy8btOFUwNZRq3vxIa9Ora2LrXecaFcvCnVHYLbulJqrQuCXIpOwnkEL2hq1eZORly5QbZaF
	ii82jjy6OYVu6eTxW7uUPAzrefHc0h/N/v0Vq/PKwmU4QQZT0jBXzjz1E=
X-Received: by 2002:a05:6a00:2ea9:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-8c8792b60b6mr13838795b3a.1.1795517696014;
        Tue, 24 Nov 2026 02:54:56 -0800 (PST)
X-Received: by 2002:a05:6a00:2ea9:b0:887:17f3:94f7 with SMTP id d2e1a72fcca58-8c8792b60b6mr13838777b3a.1.1795517695517;
        Tue, 24 Nov 2026 02:54:55 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm7323476b3a.36.2026.11.24.02.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:54:55 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] scsi: ufs: dt-bindings: Add compatible for Seca UFS Host Controller
Date: Tue, 24 Nov 2026 16:24:47 +0530
Message-ID: <61136dcb5cde2c0cfe1b8f3a488e9edcf36043cf.1795517687.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX4mktVMWLH99U
 UR2/GJEgft6CoEzeS6N8W8hzqhSxmDe5IEgSblIvWg9k0KqleDEFbzOyV8lUFeaNLdJQUKFQoCl
 /3YDYTZVVRe0mvetRqfLoFx7Ef5QLB5poYdNFAJ3OKgZXg7lyXxwWWeUdZCMisIuFD/uhrfbKZZ
 BToCLP3CANoSqlnFdl0fUjphYNIztvoNT3sN2ydXH0ZbbaPkDJb0yNkedY9UHdSCTlpuI95H/as
 RNKszvoySqu0FYwf5fvkxMUeQehTjgjQU/w8eEjWK6FtZ7HLQd2qihzFMBjBAO8bGoQKV6eC0Dn
 hNpHojiz9/xPPKAwkuoR9n6kLKVPK5eM5YwKzJFNzkjSAm2VxCKFRVVGAUsn6gez8ebvjmz9PaX
 4UEwMcBzZIO3fNRovvWvEJIKAQUjYxNB/gPPjcXFVN/QyhC1ZfvcaxBOvugsKt2yv3lgj2qmR5x
 vFOgRrSO/TrJZFFE3Bg==
X-Proofpoint-GUID: Qv3pxUTav2R2U7Bx4wIw4td0y67KjvNq
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b056d00 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=lHObh2IfMKzVuqTG74EA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX291q8MZBtqrj
 m8yeVnWuVW1LaoFKid7MKu9NNlr0UGlQhmYFpu/K+UkivGoKyJ4iDmUcs+CMEipUsXvA4Kopnfz
 o+Am5CoTjw0dENBDoumYcEF9Btowrwg=
X-Proofpoint-ORIG-GUID: Qv3pxUTav2R2U7Bx4wIw4td0y67KjvNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Seca's platform firmware implements an SCMI server that manages UFS
resources such as the PHY, clocks, regulators and resets via the SCMI
power protocol, like SA8255P. As a result, the OS-visible DT only
describes the controller's MMIO, interrupt, IOMMU and power-domain
interfaces, making SA8255P the appropriate fallback compatible.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
The Seca SoC device tree using this compatible will be posted as a
separate series.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.
---
 Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
index 66d73e9025d6..4a5dbc780b0d 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
@@ -16,6 +16,9 @@ properties:
       - items:
           - const: qcom,sa8797p-ufshc
           - const: qcom,sa8255p-ufshc
+      - items:
+          - const: qcom,secaau-ufshc
+          - const: qcom,sa8255p-ufshc
 
   reg:
     minItems: 1

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

