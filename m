Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF399544891
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954530; cv=none; b=JX+DzC8MO2CdQQrEywhzqvbO4pnJOveL42hbilPsK7e/EMtiTTWmq2/mnq+T4zlcTBJiFNyQub6gG0McP4RjacVfL3tYiktGZmbezmu+5ofL2y8YwMzXd5GTty8LqPKy4HvOs6Pl8hPZKtKhi/sxnozTRdw3WInY2xphaCe4co0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954530; c=relaxed/simple;
	bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZEk234hMFJ7tnzrLTY+i7ewXzTMwsWB9d0Jjnr+1FhqVgB46OVgrblB4kwc6YpgEBrxrxGKrkaAEUYbnd/v2g0hYsj8sJgK7/5/AxsdgNFaPDNafti371qa4AbOzZEPBk5pqiuKL31RN7DYAL+uvgms/kBCIQrXAA+YsWCFfjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGjfqDix; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7HV/TQW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGjfqDix";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7HV/TQW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUguk2173678
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 11:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=; b=bGjfqDix/tOmRuCp
	DwiVFyVxJU9onH08g6OhyrXvMKY9ZeLHlA3xj68GqzeUVgsCDENmta2l7Je7ut7P
	NULOt96MDkIrpGqfG0kN1wAwTWhPVvCmyeUECZuCFVR2xjQz2wDFglxpRVfEyS+e
	tJX7heNcIMTEWi8OkTmdJBem08Dhsk8jC/jNH/c7Ac39TECUN9Msm8kAslHyxTgU
	31UBEPN2z1S5kB3SuxzfPPsUSg+hJN7dxxuPAiGTmekNjALwWtoqXQx/1ehChCV9
	XYmPscY8Qr5SvdMN2giVIXVSs332mR12pshk9Zo1EXvCie7xV2E6uRfmGEA86IPp
	ErzrDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5rgg95q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:48:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so9141869a91.0
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 04:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954527; x=1789559327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=L7HV/TQWDwhsrLkYCRO4r9MtFljvhY6x+mPf60/Eam93o/qu+fhFfD5LwO729j92XR
         7K0kaszydbE9MkxoZoCA4wSRzuzLov+sjF4bvhaj1FyeOBi2JQN72DZgqPWHLu1HROpQ
         sQH1DAZHBs9wky97GlH8JGreu0TdPVRgnQkvFeb75BUFu42tTjAtyXUZNNkz9mGK6kBq
         fNH+ISkkEoaPKa5wb9nKBcg2ppbW8DBfTGeubGQpG9mQYbpN2ltV83Dqj5d/vvLxJ4/1
         1QO/YGZlXA3Db9+bSpNEYvD9U8AS97KFOr0ij4uWigi4g4FCb/kvUbWjrTDIu1UCarr8
         J5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954527; x=1789559327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ptw7PO2IxZi34/R9TCTZRFlXTJ7+L0nCUhyqPDnhdQ=;
        b=Pi/cKaAB7L1rutsrXoHHnzYm9wXDv5IuaaLvWg5NyPAa+cZa8AHOvEbGuZ2HhrZUWB
         4Zb2WfQ1qLHhaG0ZNE1TG35Ps2iaGstQ0LKvmNULV9sItM8bpgFF+JWwfdUbH8UIGnXY
         GrqEC+fr5vB4VHsuL589ecI9eBxLPrCvk3SFpuHVo+B9nwJV+llI4X7lPqcrUogrXkKs
         TVMeFiJGuKrWJ4ZaEYy9T99j5RFpP4YVxg0NL6RrxYzj77KYiWaod9ucjqWEsZjtst5f
         I9fzgka0qkERLIz6wpwjhwEnAJPjasliJPSSsxgfmOWKFzmcsSwNnL3fDMzrxqZJRlo7
         JfRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVPkuSYFkovaEij0DkQmxBRSOaszCmTabLmcA/xSzUTSbzpKRKaQAAIAiqU1DW+d9QtX+xZa0+AWaz@vger.kernel.org
X-Gm-Message-State: AFuF++lQNYvzaRgu/pKG2qVkexHNck/ymfvH9efclxIl7iZSBGlMtZCj
	XRXAvSv8yDvuDy8TfituNUxsP9lysctR+nr5puygdAOl4tdlWieEzYpoBNXpnZ3dDIdXyDJtokf
	tx7IlQSgX7wVTG6PMAypE8h7uKKvu7dJusXxT7h3uzbL9MnXQCdzT5l+rU8qnIzwg
X-Gm-Gg: AYBFou2el44RDlMa2Xqtqr8nQk0LHqaGntNWLk896WPScxrdzCu1Hk2LkxKvMsctNKC
	qYOky/4rVL/5yWLgEjrL2kPnGduMLMxIk/fU6r6tJQ3XdhmGnOPHNCvP3kOwlh5+AVcSUJW+KY5
	yCZlgLCDoxRuaksWdxIaXigs7zcAyec0n96f0MsPH/SH1rh8y9CFtkvKCZKKXdNrDimayOh5Raw
	gX6FAUU8B/pQHQrGU1JtdHZggNVc0wJDv4NhqP3f923Fa4jgU0npjQELkq/OF/H5UaDueO1TSRQ
	AFNYkKLgc0pEzbAKo+1+Cpsk7noser4bE2SU1DwjIDUSOtrM0kv6CbHyJbqsf9C4wpctqrpIguk
	cap8I4FUYmGFKaEi0f/fmvVNjNjY+FHaQi6c=
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451406a91.19.1788954526480;
        Wed, 09 Sep 2026 04:48:46 -0700 (PDT)
X-Received: by 2002:a17:90b:4d82:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-39d70b1c7demr451338a91.19.1788954525966;
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm50156857eec.21.2026.09.09.04.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:48:45 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:18:17 +0530
Subject: [PATCH v3 2/5] dt-bindings: pci: qcom: add Nord PCIe controller
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-nord-v3-2-b0a82721c547@oss.qualcomm.com>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
In-Reply-To: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, shengchao.guo@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788954507; l=1017;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=9ql4uJf+bmo1nNNjIE6D+tbj4KJVSk+Obl363fXcddg=;
 b=tHX0LCb+5Wt1So4bJXxbiVPpqbP2gOaAqHp8Cg3P+pLnlwY8fy6UkI5XFgrfp7cKloLGT8Qan
 L8Q6S80Gq8LCUIq/jcybPpijg2GnFOynErCs3iFo128QGtDJjWYRbka
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXzuF4QprvGeoT
 j8WyEZEKJyMK+ineaYaPvpsNXQKENynZ6ObzDGkbjPugfwmAvdy55OIxkzdlaRwH14xK260SlEQ
 VSxkfQNr+rQvMUKFA9sj5blFSWhsa8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXxmrCw1eqSjhQ
 rTpErl5HpwyplwNI+C88pwIMVXTtj72BNpsZzFoZuRKOCjL6+tOi5jXYB6bRN4L8VeUiz9mkH2I
 WJDXSVOXjkhu54auYqLmc48GrMjkgQlqvd5xnEzQyDvUP33L2pqyP3UBW7FlD8zke/1dpe8ybRN
 i/yi88dGhuY8OIJPMnOB0d4dXB/eG52kjDadxx7Q0whNoIT5rzjv/e9I2slEWE9tTZxJhYhFll7
 a7Kx34/IoC5/3nZvkhx5Qabg7hTa9B1aZ52aqV6G51bX5o79pmn5Dep64meqGnrS6m2NOsMoUR/
 b9VXVJszih7P1oCaGwJFQuVsNJBYXM+YWuiMIP9cq2zedmHdOnMNKCAT9AjrbJgX8r4am6NTpcv
 bBqWFb20bHI0iGO0Znt1xGNQmFEASt9newZlClmoltiffWHZ5tUKoH6I3Zeif5Kx0GpxgU0pEpM
 KczAxFI3IcqQKbMC4gA==
X-Authority-Analysis: v=2.4 cv=B6qJFutM c=1 sm=1 tr=0 ts=6aa1479f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=ly1VyIkaSgMpB_u5KqwA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: eCbFAqUJjqsBL-jdpf0Ju8UCQYHZGwra
X-Proofpoint-ORIG-GUID: eCbFAqUJjqsBL-jdpf0Ju8UCQYHZGwra
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

Add the qcom,nord-pcie compatible string to the Qualcomm PCIe
controller binding.

The Nord PCIe controller is compatible with the SA8775P PCIe
controller implementation and reuses the same binding definition.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
index 63630a814f28..b8ba2c4449b7 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sa8775p.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sa8775p
       - items:
           - enum:
+              - qcom,nord-pcie
               - qcom,pcie-qcs8300
           - const: qcom,pcie-sa8775p
 

-- 
2.34.1

