Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC8D328B62
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144021; cv=none; b=qrk6M13lltNkY+JYPnd5fxhWxmi3eBywk3nt0m1ZzY/jfoT06Q2LeHP/I4JzN0NFYhXBAia+NdrzLjSaBwlQUmiuU99i1VU5RyD7cvB5rfCabBSYiZ+t2q5G4NgQhBLhqvJnlrBVfaBzD3ppOMhBp05h6E2EQI5faJYt4s7x+PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144021; c=relaxed/simple;
	bh=ZfMUu4gStjGQTf1ARp/kDn07RQ0rXubGcOAgh2EFVfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m39wfzuh84Yz9kMz1NUZJA3vyR532XQk6mA25B8YoMAyYKD9N11HqEizqZ+fBK7KMVfNdjpN1TXKCHKZKy4UDZbNOV37L6b/n0+6VMaYoexjVLBU1j8QYD6lbMIMGR1XZf3v5XuxSZMcJGMxJ5djK++PBWgQ/Hhyz399pwFHzLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLTdRLFU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MAAxm1KC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLTdRLFU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MAAxm1KC"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClMHs237485
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=; b=SLTdRLFUIUqZccB+
	0Tz+rldd52UBhUzQsMC1xA2tFwPwfKtVBj1MSEIICXd6eN+74wGrTgag7SSlCYIh
	DCWvhtP3SFMvTnvbppjaaJTeWBaNvgVbpTaMY0JMG9lWKMsQYKMEtjAweij6tqph
	B2JiYzBhwsY26t9u0tJQYW9xx416+T5b4apqi01b11lnlTXbo61eg2XBt9JPSoP4
	i4aER0toIVDiZP/Ke2nW1HRbJwqn6KoGqxeer004PAR8OMmzUpio7I7rdFbnUK56
	PbOtdmFjeRDhb6gsj003xRW7ysTgwblMW8qUM2lFP00BnEVgD3m16rsstU2/m7Dy
	hWbLJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfnb78b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 12:53:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936d067836eso122467085a.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 05:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144018; x=1787748818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=;
        b=MAAxm1KCyq6O5NkKDfnoyzPpr1E126FZZ3NCE5uzp1xQHUcYCakvv4iJHFavT878Nd
         HVuQ+Alx2yJscODp9sAfuvks5PmNBp8gofSg/t3hdK42KYsgZ5rJk81gyyWWn6dYThJV
         OYGbqZ+FRTku70CwaaB6EF5/1QsT2HfXPD7ooQ5AYXMGUU8BJGdwgsnlUhtaH74jXd6R
         WqRug4dDGuPmsYHCUZchmYTy6USP5qFV4/JPIqjFlqdvfPP6XIlYL7UxyXmkaoXyCmv+
         9UkVJjjGU81mseCkGtz0b8oeAgVz0tDcg5Jzt904CUBscZ98il4sux4z+pm4+QlJHFbL
         djxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144018; x=1787748818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw+QvvJJQhIEbjeEXUdWCIfWpCf2Igi4YvszgkY9sRo=;
        b=PoOgGUhRdsL/o4lXW/d/edbkLuGLzjR9Lw8jI44crNrjDerXLt25k1VtKATUGXcYLE
         WMfblQmMZQg4in0FiJ00X7BmUFwo3Q1+0QKjJWDm573bkCIAlrnpJwvE2D3pYOLL/vtu
         QZe/f6W0sNo4VUDKWU2EICuZXxCHj8NFjjDWT8vP0h/DqrWlk20RV2V4MJZRGKx7/Ut7
         lis0DoJSkdOoEnAwGVX9LwGQz0FMcDqzeEa942QaaA83t1KFAVjdmnpYp7AtbpZapbjs
         WBHT2sQdfl8z6KOUMfQ4bej5wQxs4I347RiPnvQ4F+Aix3LR7f/vaKkthxnHEOz9RdxN
         4/OQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqi+LqN8Jnsnby2ind97oQXLamIxn/GmvgdK621cBxi2ulQOlOEmeauLUuttEihYVmYJxDvgqG0nGO/@vger.kernel.org
X-Gm-Message-State: AOJu0YyH93Z1RSBhTR7U4hdPSaFHH8xpW/TxBbxmNYQ1t/RrWc9UlbL4
	yWXJr4AwG+Ncf3BBruIIUlEc1jpqju8LjzseKZr2dgDzXc3B9uCZZBwESw/j4mAT61zkQgkgaQW
	VTHe8GfQgSbHQC9ni4yZ576tXpLlTXNr0PfnY1NFYgJrzk1ID8J+G7DJrY9if8Pxk
X-Gm-Gg: AR+sD11oRQ/4lPeu9AR10YVRODkYK8zjuZ9AsMa1++UBVVxvHl8i+6rpIOv60bze1MU
	IH1oac8QYzHZLsT+ME1wt174znOZ6Esl1N1PyFjms4dfEGEC+1Ty0KybPAImpZmhBJzH7As13+Q
	LTmajTQX2bUGRBa8nwy8zlMvh71JXAcENqE7wQd5R4sZLyZeQXra/ejORe2DERp2Dtv2HYdsXbU
	Eov/WtWGbp54oCz6RSu/eJcIE5vH18R+9b0RUWokA9OUbrLnWFdVg59XDHQea2mCivrouw/VM/p
	OARkxhch6eQcfepcj6C1rTccfMZCSI2xiNN8t2c+OSgy7Xrit1gbMiPCNgzmEKhcLKpGiSxpujV
	XKpoh05XU
X-Received: by 2002:a05:620a:270b:b0:936:6a42:fdd1 with SMTP id af79cd13be357-9371e29b04amr451293285a.13.1787144018481;
        Wed, 19 Aug 2026 05:53:38 -0700 (PDT)
X-Received: by 2002:a05:620a:270b:b0:936:6a42:fdd1 with SMTP id af79cd13be357-9371e29b04amr451289585a.13.1787144017991;
        Wed, 19 Aug 2026 05:53:37 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:51:55 +0300
Subject: [PATCH 10/16] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-10-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZfMUu4gStjGQTf1ARp/kDn07RQ0rXubGcOAgh2EFVfI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhacYNqY7qFQD1v+MHzq4/LVH0VOstha8sjcBq
 FFaPQRwktOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnGAAKCRAbX0TJAJUV
 VoJQD/94Wt1a2I0HgIGfdjfYPVzn4PXqWan1tvMQeyoQuljUNgk6QncgcRVWR7+4ewN3g7tDEtH
 iLZtu/xxob8+DRvNea6RGcKsQC5fjgLujDzq7If7z59IczcxpW+BsUVEyJe3LROW7Dgnty6/wR2
 gQTOHtKxPQKvfsY7CKfd0yoqmQepc8D02kcx8uTDA0kyCt/ZWQoEy0liSD1dzOTv3I1i+NYzzX4
 +rBWdAp23M9YZUkx5JkNID4ERotvK29gaSFgP1erD0NEaHquNJb6B5Se2n+Xtz/mQnsayzqj3HE
 lF2plceesVYGqU7BcD5WNQMudqUj83jSn1dbDJvSPk3l2PB8aXOmup8V5+KxW3AjPnYM98i4ym9
 5L4mJyHBl88i6VnOAFO5KpZaf1/3wXH1/h4WqbyV1kgCZnLJ4zy/6HqXZAQ0m5CMhZ3AidJ5RDE
 pySMKiTvb4+d51Cj2qv46vZuz2TLQRBw6Gy1ePvVdRW9O2Yh7Siz9gsK0iQK85bpbDJcijnVGKk
 fURfxn9VI0iw9++pSV9tjqAWnU0mUMVYjEzyMFPq/dK7AuKnQb+VJypX3l2toXjO2WedX3Zspvb
 Bg3GLPfa3qOnp0yEnn6hOq1EWkp5i8xW7s5C/xY6jyUfAPwBqV9xl/xEvhZ+aKsKoFAKkly+v4A
 v5+x4IALckolWJA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a85a753 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: GfVob1OBJdvWRTf3ZYrn6Xch19ycmTEN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX7Um4ZEfdLVeR
 lN5RfZOVh3QhREOmPfyE2xHdpZMqCt54E+vZoep5fk7KM7e1Bjz4Ch4zN/t7fi1sJkmZv6YJ+9C
 wleRqp/BV4iDVuBfe4Ens3teUuJ3x3w=
X-Proofpoint-GUID: GfVob1OBJdvWRTf3ZYrn6Xch19ycmTEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX8eMR/wR1i9gK
 eceQij5KBiO4rn9UamfPti0eqZ1sZGNzA4s5qSZ9rraIe8sJ6M/lM3E7MlbOz4p090POxFNCTEK
 JyawyJpkOcOOGB5D4c55p2VUX+EHmCkULS7Hg9XqxN+TfQQNAfI9M0WitspzbA+Ufu82CDWO+qr
 h61Vord4f/ARuXsZXLJ9X+AkkCNlxkViCIhhbkk9iiCGUAZO1iAwE6m1ZXWcE/2FxgErgQmGrQw
 Z7NJqZEoiTSKv23ZH9g83PbcmX8a6MWkWhbYAoPZ0pVC8bfE5HPNEqKIRMI2ASZQMPAShOUJK2i
 HZVBi+V3blhQiQZzPeg7AymfWNmfiKpQFHvZugkpu9zu3weB/sVXpchHwzhCu9YnQqlbWGZ8wsy
 +pg+1qt/uncz3CtLfNN18pt9xuaIDU10nxw5flpDHWDdUGl8Jpb/d9ov9Jy0deTdINUL34szAcT
 bW690KSNfEvfnP+VIeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 32b47f5ec1f6..84012a407c4b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -699,6 +699,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

