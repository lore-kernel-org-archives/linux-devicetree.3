Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447268;
	b=PEnvZReQw5UfKiBjaqZCMaxLsLLG90H6lr3txmTakLoDkHqxuHkViy33AZdvFu8kpxTi
	 UKSxwUd5vNGxbfbBbHfKeIF6m/18ceEhbaTiwDWYwJwJqEkm/BU4JQ+FdFAR7Gd7OsAsN
	 02fKINs6cl1TmPHSdOFinsCO5ujKU+6LlA/8EIp3Vj8Oj1Fb2OyuP+kIHD112b9RZDUnT
	 EaCO1xT3FxqaYlBeg7Ov0Fx2BvKBEWFyPmAuuHb1Wxy3hTyDf0J7E3esvYeS1/0Knrp98
	 QOd6315/8HzoMpPSMh5scf4DagzouVXC17gF5txdi3qXejh89nt+lW/e385ZA2p4MkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
	b=bvjaN4tZudqR6saYCT+KI0dkjsqiEuT2+clFuj9YB8UhhkZXdnCvbAJWDtxzcQYAsD+d
	 v25hQC5bnki4qlFD/QSvSV49OkrAM7h6pvf+t03KdPRevQlFY6Xk+o9p8yUqkxjDdQlka
	 X0RE2L94U7FkUuZgRVv/UJBajmf8TV+RHzALt+OjCRfO15Bp1DD1WjKmLPG1tJ0vEfuL3
	 PiAVRsvSad48PmYwF9anH893kgiY3TgwxvTNCSsvr/NTSqOR0jpbzLTgBRkMQ63Vxf/JJ
	 UiadgF8YFnsDTcHUNKQm4txl6AKZ1luemcyNl8TaP+eJDWOzTH+DWwfGDE4aTH0RoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6918606A321
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6918606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7rhCiUm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d6ZxGWPi
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLPaR1461620
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=; b=Z7rhCiUm1Yg2sudi
	2PFkyr/8G2GSQ4Rw42s2N0EEBhXHuCXgraAr7/chrPArc6k1xjUap6408kqVKf8N
	bZmucUTooXeXiCaPET0e12DVrfdO+xM8CgT/1uA8Bin/+lX78MeuOTgU+tX3BKnp
	woRsr0MVaNFnKlf7+OcaJBEib5dlY3RC/Rv1UAt+imNWfpbObrT5lmFCrSQnUdRW
	kmb4qRTCQfdSm36xiRHDrKC0672pJn4zNknHviC4l2oryid8EkVfEG7o4ClqcCRz
	lC9GUrpy26uwxg1m01uZ8hO04kt4DVwCWiWqGiOXcH0etGd7/o8pRRX2YObIi1x9
	nudJaQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a1yp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:21:07 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5407322f927so143286b6e.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447266; x=1796052066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=d6ZxGWPiqbNxaw5lhbK8DQAGemnqRRPIeiJ5GTZcv+h8E1sgfkr63clTz64Zvng/nv
         BcU2LCU3DHOgPxBzvwFhS9mNzBYK48KoLOPFDlK15SQjuh9Y3bRsL2tR1w5kHsCzSd0G
         DsPF5MTaMNcEXn1DHS21SlpgGI97M5E3BmkX1UYBuOOYWZSrLOyj3a11Djc5kAhWwVSm
         6CjyTgvp+JkZDHOj8GeS1fSy9YSoHauHUZkuv05R7lOK8NoNDSLmQJFdnb1Js0cE12gy
         d4HDPQVgM6jIP6sPFlGSX2YNpKTpwonSI5a4Qo+yhY8LL+zTh9emHltPxqhf2fuuJxvi
         esrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447266; x=1796052066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdyWnBJTIgrZY1jF9JegcJlwviocUMY4EwnV3tMGDMk=;
        b=C0JJwiZq5JDveCWe1Kx8+CHDPpAPdJeZmFWyBt8U7nGn3HCKpp8P0/wT6YsyqcM7Db
         p97BdxcLpyKd6k03wKVtx33BGi2X19T3puXYfVkZU82yN0Ube5UxOKI2JRFxPppqmL9X
         ubbFhME7b0xpo2TXHL659W2ACiS9vXVr5YFXKNutWjaSbfP8IOgh2eXY4epxS3OxXSrF
         vURlsyzFq+y6sgGU/8yXSF31TLZVLXTIcBMBIg+QfnDlGW9YVRFR6BozuwiWE87FZXr2
         oq7AJ7OfKzr12s3h3OZ6qNj2MohqWNtMlVtX6HvWoefBwwXd7YIVKPhspAAMugFWluaH
         mX2g==
X-Forwarded-Encrypted: i=1; AL+hErEsUB2rcruo4Wjc8pBmpPwAQE78A5ScEnNZMyL710574d7je/h5433hFGCsxz+bYX9OpVrtgZYsgkIG@vger.kernel.org
X-Gm-Message-State: APuU4Z/hBC63A7NcVXsz8n+Hp8AjslWBI/hpC3R3fttZhtdTJN2Qnlhh
	BgVZQnsa7hXxroHtT8lLshTsalua6CBCoAVJOoGP08GbBLGGeNuEvctl6rjhco092DZ2zVWNC7j
	nruksG6QHPrVeD916tLqJHMpdnCzFKONF5YJNd++YEaUPS7ODGO/cA9j1nGiyDCtM
X-Gm-Gg: AZFdTZfzrF1b6BSX06WwrKjXmc2eklWHaSA1H4ZKfjCFqyZCKrsoNcb+E2fgkUzyvkT
	jaRe/qPUKf+GlI2a8xTVMy4ai1Ks6ck8zDp9sLHhxy+WOasDcnS9b8czv9iAYn1VEFewYZ28BHH
	l/aqJ7MSmksONt4VXMTn3gDINgiDa2k1AEn9O0akvpIoJjaODEEyh6hb2Ndj+5iqqngHnP/Yx8Q
	9ZaZe62oejjcQFc7iqok6Jk+fJvhUiGpo/P14gCt2lNgo3e6JmjVMvo9cVFuAteypdAVf5Uuef7
	gqrblx6Xr/UVi864lFUMWXg78O1Yw+8QSs98hmEcwW2Xsp3Hwj/nRxp3HDj0AZvCH3Ob276DRjb
	TJ4eoEkBizI5XjRYU3O76wf1oxZdYznkbsFeFRYpkfGes0LpztgrHUsM+7w33kqSnV2Fa1w8=
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194556b6e.1.1795447266167;
        Mon, 23 Nov 2026 07:21:06 -0800 (PST)
X-Received: by 2002:a05:6808:5198:b0:573:2541:180b with SMTP id 5614622812f47-57a058e8466mr17194509b6e.1.1795447265752;
        Mon, 23 Nov 2026 07:21:05 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109c58sm5375497a12.33.2026.11.23.07.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:21:04 -0800 (PST)
Message-ID: <646c17cd-aded-46dd-874b-dbe7ae0f4a1d@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:21:01 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX+uiJ9GZ9B32d
 3x9ODe9yJ+wy+Z50L9hhYthl1Ot1jdlD1HZl9rZSz5sB9pwdmlwzGwVGqeYO6wY7vRsa5DNvaG0
 2XO5zVEVFX6C6KlTlDk8Ai1q1ux6+AQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX3hGlfvWPzKu3
 1eJqEszsroHoRVq7H4QNFgSNvisle/GAsEjcBqGVyclpcN4OkYFTslUsqmfcu5U33hY/+aiukwv
 j//PYb9DFR82jmE1eExN8dq2s3WFWeHLHR1hfSi3VkZWEVFIi/wBq/H98pYHLftJ9eveao13q6f
 Ndoazd16mKbUe2/jiRdmofe9l5cF3asv8psP4eTbs7zX7WnPRSTirlUzjzx7IMuWsqRTKaCkGJj
 GzAlGucrzN0qkFfVF+dLyRbyBsMvn3VIsVjRMbQNKKbi+NWK6TQxy2mH3v15zK3GsuZCj9ZvP8T
 F3JCqj7YWKAchWPczDkJVsfO9sVgz3HcJgV9ag8QYnWx+YU4U+CXB51QYui/sAjVp6jrGS6+iUu
 +WEL90VwWws3EsSw6p817vtATVEEHm9OGPtvELokbCEqR8w9mzj/yJ9+a1Wuirh2DtrRLHXGK8M
 y1H1c6IoIP9ZFpm1ZZw==
X-Proofpoint-ORIG-GUID: xLuO5MuHYbTklhUdscvF88f6ThDyMLiQ
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0459e3 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GtvZotVShuh0uySl3soA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: xLuO5MuHYbTklhUdscvF88f6ThDyMLiQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/16/26 6:27 AM, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
