Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3625771
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 03:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783135611; cv=none; b=VOhEVYF+mz5ZQFTL8remMa8uNNmK47D9n8OW2hH1trgcTezPimOzktA7m0cvgVqkAQcJby2/GpnmAckpNQlQvJsAf6kdNJ1CkmG4xfmLn2xzeJ6SQJIEIc77oT7oJsCH054qhYnhIph5MFJTwRbm5V3dIWGcP5dFdd4PmXccr/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783135611; c=relaxed/simple;
	bh=Z52KdIIrlV0P/pNLWwB1lBDK89sE2xDmZuVC79UC0Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5d1SFrpNz5VAJPxijBdMNu5IwwxgL7avaG1zicAWz/fuH0P0YeAZHLix3bi91wliwVsLSsfS9dfOiq0WPejjCwUic3aNnL5P+Zjqb93bB5JcW/CnQ0i5j5h4i90fiYQwS7/DL6+CHH3ZlHl7MhH6ZdJHvFNSnUjDkMbwrz1ZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izniWUTa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R46eMMim; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izniWUTa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R46eMMim"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6642Z39w1776621
	for <devicetree@vger.kernel.org>; Sat, 4 Jul 2026 03:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5ZzlMleCvK6/EpDoM9z20FLc
	dYB9f6a97RZUW39bIrs=; b=izniWUTaoQL3GAF91vbowfU7qUnLcI6UVV4R0try
	pSuEtS/kEy7GgOOj1MNyEXHJF1c0fJeVeEtoQYqpL4+OmzPYR6pFmUlP5raipd9o
	gFr8iLAGw49LRJJ62scOJERBeFlOuzKU6/BxEE3X7y6PA4BFNKMqorQDag0EHqXd
	UZO79Sge79rxCh+Sd52Soq8mTnL0xFBoR5WKLl7LKE4skOfyeSciE5k3M616c1pd
	ldAIf1Gsvz4uQpuE7TATxq0UJv8fu78RCw8eZHWfc5oI672kd/a/XeiapZO04oV4
	AoCLrhzY5XzmpS3WST87CPv1DNYOURaUD66mm+Jxgs0mFQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh02x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 03:26:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-384048e7e14so137764a91.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 20:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783135607; x=1783740407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZzlMleCvK6/EpDoM9z20FLcdYB9f6a97RZUW39bIrs=;
        b=R46eMMimnRsDsNRsj+SXoBNCCDMHcfGHKisB31lhM51+Yp3zOuzmyZWwxh/4mMBcdi
         t354Bfmd9BQdtGL+UQ+aVI+PpS9Ed8nWav/JpBf2Es9BEHanxLELoTAJWxMB598rquES
         mH/PgkVj3X9a35Lubt/SaklnDRHPOkZ5QOQ5irD/NFkzRSr/GXhYCRXfF835oD5n4Zab
         OUplVtGK2rsnug6POdsW2BfqUsoTJ+29bwzSF31PJ0FbQ1PKYlKGd5VO36izpiKnzfhD
         Doh0nn44IvJK0z3giKvtz0HQFkzF4sUiI680CtuKEBdkaklWz9y+RD/F6I+5S/dLNYgi
         EiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783135607; x=1783740407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZzlMleCvK6/EpDoM9z20FLcdYB9f6a97RZUW39bIrs=;
        b=hy5AVEVWjYUb1VQjwUf4T7mHUpboPcFUnTObletLc908pKyn6E9KCdKI6s9wtmfxRV
         MtQdq3NQNFCyT366k9bVNmShPfXfxt/6zWB5u0/PWQbfYhOJHYCLaQNF7T3vAhsVyt9R
         qfqplKKacN8gIeEdLkRxCCaZio+3P1/mk/zlPz7YsY8B3hakM+Mo064OVFEsJQtJInVa
         b6u6AnzLZcVnwMxQvc6uJlPwZFhVGwgqzMF7xZVOrdwdmnTOCH5CjjyFKO2Qe2Cy5VL+
         NCC+DfPOEmnOrOsLUksD/Jj7dVVsM8prP2l9SsyEEadLltXAMm3t7m6NSRVfVLPIoWVv
         5Jog==
X-Forwarded-Encrypted: i=1; AHgh+Rr71BnSJCIDfgUpjnaUXLBsJc5jS3yTJAsNPiANxFSgZqru2eVCswDhwe8N0zoL5kkxUp6sG728OKSI@vger.kernel.org
X-Gm-Message-State: AOJu0YwfPqans88OLcz+kGzfVY58DTOGiqLF1OqKZCeTW78S411+KJyl
	BRUJ9ZzEO/2kntmHRCxY5pnJ0Yh2g8ingqQD7cL3W4dRKoBLkz35FAedYdxNGajMxUVXN7FxZ3R
	zOYFJyt74rGP2eShc68Xp5vu3H5hkEqBlmR2V89wgg0gXFcOWXYcTkaBUBnBGkD1n
X-Gm-Gg: AfdE7cndVRA/Fm8B80+Qb1IbKlfoYWGCJda0vsUC+7qD+OgjGDy/AuSpJT+81PbgpXe
	C5UA8QkQB3VBvJ+TYZFZdfyfC/HBkdsJqVP1do9xfxUj/M8kfoQEtK/lnAdIQtExTf1H2y96tSK
	1zS1DYToumnM6s24wJaeB3Ia9JMOR/rJvC8DYfVFmteC98dJ00R336qBsSZ30UeEfS8EQQ6+Zbd
	1L+UgCeQf8wv8vj9N2elgSY7v8Gv8fHhl9hK4QBakr9/DLZK9XzVz3X+Kl5Iql9mFYRgqTCFH+w
	6AkkwBWSuu3tgEH3fyzhaPfxLK9pP64jETMtgG982WMd3czkDSkGd04b2+4jlqzNrFKhyBSFVjb
	qlkv5Cso25tlrh338/JTQY+CQ6mbjJNfwUZY+SauM52aTZOl4NQC7nw==
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr1968781a91.21.1783135607307;
        Fri, 03 Jul 2026 20:26:47 -0700 (PDT)
X-Received: by 2002:a17:90b:1802:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3829f007711mr1968751a91.21.1783135606815;
        Fri, 03 Jul 2026 20:26:46 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm43793015eec.9.2026.07.03.20.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 20:26:46 -0700 (PDT)
Date: Sat, 4 Jul 2026 11:26:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mattijs Korpershoek <mkorpershoek@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        prasad.sodagudi@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v7 1/6] dt-bindings: i2c: Describe SA8255p
Message-ID: <akh9bzlP12sRM4Fw@QCOM-aGQu4IUr3Y>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-1-ad736dbeab57@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a487d78 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=HYhALLXNZ_QuGUvz3fMA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAyOSBTYWx0ZWRfXzXDy7a83IpMC
 FI+CfawltjFwCXXRhpH9n70ISdyH1qD6yGT3A6ygB/EknOIeu4PaEmY4HKYz4xqssidV4G3XhHx
 DGAqBQmTb9xXXaE+j6ivu+CdNsvN3F/Zi54v6vxYdNJp5nRxt0zyxZ375ZS0A7YyBk2ec4pySQL
 UsCg04K2O7EKJUNhHDzOneBauziFxUHRrwEDA9lT37nTwsnW00AT8IBjUu/C+TfH+MHCGGA9LwL
 8+anIJNp1d0rStlY0yUwoC0lpgM+olWpQeSt91HfdKO1X591iXiQN9KHShzEhfhE1UKl3Rf/ETn
 8BW31pN8BJJyA+ZPlqvgwY+jnRS2f4rj8vZnrRb/Gfrz+1Vd55NKRyGKfz0nTw2bkj52SquYs96
 y/9eGkp3nj1eWN6sbK1asIhj4NYjEWM2DVh6Osb1PQ65xQJbGFdHEr1DfTHVPeV9YKHxs17l4d5
 BNUp3nc0pvPcFqqVF3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAyOSBTYWx0ZWRfXx8p0Q/+H0KVD
 JbnZlOAzIEnNfUbQgZWsQoRbFsGaP1hDVdGmbc8Ix1PoJdpkM2byMBCa2NM460S4R9tusyATHii
 xWbwWcHGIjmJiKQtubl3M8HGJah8rag=
X-Proofpoint-ORIG-GUID: wWdCc_RmARgZC2fcuAn86pTguBG57G6O
X-Proofpoint-GUID: wWdCc_RmARgZC2fcuAn86pTguBG57G6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040029

On Wed, Jun 17, 2026 at 10:20:15AM +0530, Praveen Talari wrote:
[...]
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> new file mode 100644
> index 000000000000..a61e40b5cbc1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SA8255p QUP GENI I2C Controller
> +
> +maintainers:
> +  - Praveen Talari <praveen.talari@oss.qualcomm.com>
> +
> +properties:
> +  compatible:
> +    const: qcom,sa8255p-geni-i2c

The compatible had already been defined by soc/qcom/qcom,sa8255p-geni-se-qup.yaml.
Now we get the same compatible defined by two binding files.

I spot this because I'm running check_dtbs for Nord SA8797P and getting
complaints on "qcom,sa8797p-geni-i2c" compatible  which is already defined
by geni-se-qup yaml. But check_dtbs seems to be running the check against
sa8255p-geni-i2c yaml added by this patch.

Shawn
