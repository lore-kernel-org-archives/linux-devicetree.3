Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90716486654
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390182; cv=none; b=bFoKRfRKdPHXL8peuIRko8zU+u8I2GZvsQklY3RXQSmPbNmTu9fzlLqdqZiaLWyciNaOU3xFO49swhFZdtUt28DekWikQnNkP16gLOwqX1DqwEJDOrnGvIVMn8DR5pGdZZ1/CLbQEjkrnGYS2ubzp3GU4PLl25s9jgRBniRgh/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390182; c=relaxed/simple;
	bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufmgcs6wPzzEtlHfPJlNLBN4B74YzP1gMkMbXA2Ds792MYmITa79dm1jL7y3D6Wya9CemPz02GD8fTw68vrpiV8Z7J2GLXHA2kK2hK8agNwEMMonUP1ybydPFxDHgDigTwGxMbpIYJcMUlLt1bNR9NIurZsHDSjdsPOD/qJfUVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2JuHm3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekN13vQ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P2JuHm3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekN13vQ5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm6d53291509
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=; b=P2JuHm3inMJI45L9
	sHNiRBESsPdey5/wq3iubb5+D00ZW+GaclkJPtE42yMJ8Ytv9uR4U5fxQ64kU27b
	EWcuTcsM0SJLNVjVJ9L5UN12UQao1C1ln407b/UmzlOSynLgnfe2dF4o4nWf2q6r
	M4ZV0oG9opM74JwhbwOZlL3r4i7bHSgGiyRGJAaA/XjboBc/zVLq9cdHw8zrtUiq
	fcymDXra/cGOu0H0pPYAuMAudmdNezjrYL1l3KkwQbYbPIijzwHIszhD2AdnmHx/
	lMhF/SPvAQUJwx2q6C6d6WDeM1Usx8/9STLiHVVXvdKxPPU1FK8c132OrDGeMYjR
	8OBLEw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg8nmj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 12:49:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so211517685a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390179; x=1789994979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=ekN13vQ5LHiysMtxGrSynLc3mkj+sogZ5hkj3Deu8YDBgZXMMIPAZAKYB70bLi1jcJ
         p8hDK0+pLmhhHnRl/0Xj4+dRZ8ZaUb29UpP+NfzZYZlh6ceVTj+c4eVpTHtx+tUu9448
         qdnJgkwfwIYZvlOpj7svwGFk/huVbLVOuPyDyzpbDKj8r34WhOI+PzVDNJ5Q20aEFZXJ
         WGM5ovcN8mvxiTwWxOeWdy1O8538KhvGZVcJVI008jHhcLYB0RKDgI5tPND5eSOL2GFa
         ZVrGMSuRFDCUkHjKA2e+MjzNvphfQnQ6Ax+Bvv9pFG7YVYUYuhxdDelUA3RrERTj6HF0
         vL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390179; x=1789994979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4i7pc+ADXVVvozvdZGnVYBctSe1QilmenoaXcxXjh+g=;
        b=oATtvjRwZuIuuSSfV/WgWey51x90TxZkqgMocLsfOP2nSu1LqOACpsBQ9+B+fBeY2h
         FvzFtJNwkt5doEwyZyQbTO7W+tBx1umEu9ApPt+7qofDfecrUeGP1i63HEVmmoXvigWK
         AfDTHPcCNPuL5Q3AZismy4fblW4hgBtO7mm2hUYRfOhxN3+gmfI2pZejMpnOMEVJaVGG
         bUtBfJQS8hZUV/EU9NGw/BkLiSMo24P8CvqpyVmqmbdMeRlcN6OiMUKSX40NlTub9b2K
         X3iW3ir86+XGaMMeBG4sn8cQjpLNF3zj/mCDTICeU7I76hqeEQbRdG96vuArPFCSiszy
         /J9w==
X-Forwarded-Encrypted: i=1; AKwUvByzVekGCb68pDn7qOSofm/G0jLVtho7Ph+7/F5NGk63QbMwk61gX3svf/op/BOD1xzz+gJttf/KosOO@vger.kernel.org
X-Gm-Message-State: AFuF++m9E5yTwzYNGuH7D2VDpcnoaT42PBL6gMLhfEpe0ZXIS8L9YYwR
	tDdrkZ8Cn6bIEQgFvyN7j9r21gAewVANl00XqnUtihO91pU5FZPwZBUvelwSHqVA2UyccC5kLCr
	xZDmUo5MTDpQgQSsM9hiItnHyYfSuLeLPZcVTpLERVbAfF05Qaxf0Wb9MtQeDLgH1
X-Gm-Gg: AYBFou1Rhfz+sjdP60b7l7xNXx8bFBmnLE+g39WfPUvLrip75iNoc6ESrCT2/YA4Qcq
	7jkj9YyFmrE0A7BgA1CszxAaWy/8a/db2F0Bpf6ti6bySgypBuJ73S/RrhViC7snxZaEfyXE5OL
	BWD9mcywjA0+19hMGWto62aAu299vSZ/EvHPK4+jXyJNOilic+LASmgJ+gztX+aDgW/1U3uHjW1
	u31FxTrVkEJ83BI87AJ2JdrFKa5UzL+xo0zFH+XyltAdoXDDZfYkJECrW6rFhPTyGuStG/JmQCs
	FploDJvcoQgDzK2PTpSUL3JHKWs8c15eHH5VvBc1kDlzmbiEjzsq+GOjlefhJuj49zlHJsACXXq
	yL/R1+3wy
X-Received: by 2002:a05:620a:6cc8:b0:939:f5c4:ae5c with SMTP id af79cd13be357-93a29a946e7mr332044485a.43.1789390178357;
        Mon, 14 Sep 2026 05:49:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc8:b0:939:f5c4:ae5c with SMTP id af79cd13be357-93a29a946e7mr332038585a.43.1789390177779;
        Mon, 14 Sep 2026 05:49:37 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:35 +0300
Subject: [PATCH v4 36/52] clk: qcom: gcc-x1e80100: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-36-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rahoujyANmIs+SzbF411GraqoN5ZdYQDB5yRASGUxxU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zupLxzgXL5Jjx0LOhc42oZRuj2jWA4C1Dhn
 FYWJkXw8QWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs7gAKCRAbX0TJAJUV
 VpJNEACHTevNtfrGByvkSQP8o6CxNMJfJ2ofJr9OZ+voLW4pZgQ5RzKm9vpS02jGm3CZPHvVee7
 PaWWRaFjZkEtH5hKI240ShvwTXVjxbg39wwrKUmVXUKmavjvXR26axPsqXjauegEU9gCeg9+bVB
 AS+strLcLYYZirWJEriUHbPYIClwQNe/sM96+CR6uDa091pNAMn/c7PQiiu66SlE6+FN0XVhqyR
 9iprlul5/4EyLjn/u2jgOKY2fN3XS4oYBPVLwMmnyvmsfi2dT7ZCcIDk1M+Pg0DNBsBelFVNUbr
 p7Zfo1EAvUFEtCzbRwD4tg/sIOuxIj2sp9dwyRoEkl5EQpgD1tAoMRvjxc7urJC/AotYzO6VVT6
 k6/joFHWigqm4QNuxa53vjE03gJiFVdniVDtKozLwuLc9Lo6vDd1vvw8SxsIALBBFjWkL9tpQUo
 ZCrv13UP/lue03vodx3mRB0UkkcdgCiyEmXOXk/qxcufNsa2++PALJB8cOjVBYVDJcYT/29T0p8
 30hDDW4GVlmpbRYozt2YXYbipzDq6i9WKBlUfOV5SSZcoHUMoWSQwMPRy0tXtaARn+WejE57Q7n
 g9kMGcZSsl9EWSdjOGEHAfUmQtOKCiZ5BHYTsegp2+KsNf9STRpgs3TlIj5UHnH/YgIowmGJmUT
 3VA4i+Ad/+1YLWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa7ed63 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: NJ78hQkXU8EO6RxC_cCht44046QT7mND
X-Proofpoint-ORIG-GUID: NJ78hQkXU8EO6RxC_cCht44046QT7mND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/G8AEMtUpvkn
 ZOlVqS7trG9o0SUADrhu9MCbzg9YK2OOJNSoSjcbPZy2XyDZC9BpKFp08KiVo3JK9Ld8D6NpLTj
 ZGEG+WQj4OKUCiz3FIJN7IChMKDEZxqJdALLaIpw+ovZ6E/fr3nZf/iCje+acsO4rLFfxFuUpzI
 T5/rfA6A669TRdzVWnAN45LifiZCWH00CIFMtUw5CsgSKrwFzHfZIAPEpmR78wC01KUCPpWlgVA
 +BnE0l4rNdeV4X4WYGdelESIAsB5Xbnv2DZnCi1WeHC69SW4/78SEQm9CLdy/o6vw8aSRCNYeLq
 S19OsLPKQlP4H3iQLvGvlm0tcsoQ2NEUbPp/BhIKhGXhg9mPM7mp2s8zhWSzqYrEpWQUA92Tl4/
 pL/ApVVfAlEDff9LgWK2ScG96bBV9ZVQC4K13CKwSCL0y7IZgaA3L78PhcnsF/+mxykfziheFeQ
 NHrgAaCDwj3sKhGK+WA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXwhWFLMmUKdWE
 I9p9hyEtzPB6OQwrrV7W2Hh23bfecTVIlgJ0Z7Dry3FjseV3YI4gZ3iA38wsvgdllpJKnAgP3cG
 LCX0sWQz1AYvvKeE+OLPqzF7V6n4M7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index 8c146d62c077..832633a85f1a 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -7449,6 +7449,7 @@ static const struct qcom_cc_desc gcc_x1e80100_desc = {
 	.num_resets = ARRAY_SIZE(gcc_x1e80100_resets),
 	.gdscs = gcc_x1e80100_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_x1e80100_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_x1e80100_match_table[] = {

-- 
2.54.0

