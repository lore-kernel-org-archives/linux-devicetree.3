Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027085;
	b=Z59yGqhRT/qWlreoOy7gfDRVKVb81lt/bTbXampWH5NR1nrp0F2CQv8OCCjAsqssNqJ0
	 l3NhjKp+NekHD2c+WcgwNzZD/yh3NYOMsi+WmGaGlVStC03sSefhXimflQ6+ozSFBxpqz
	 F+calbxiLtS9Gzr1jOcL59e5r6689vzY1CPSOB7vi0IXPCUFlv63i+BhQBdXOHUBz1PVE
	 JDdiuwWqhVpRv4DdHnO+16drTAK8g6wXuec86odDox0vCPwz0DLzQfJd6qHnJIRnDugYU
	 DEfkKWecI7B9a9EMsXHEDk5yrBVmUTG07OTNJ0B+5liqNoqNvVltEHi3lmiZFBgnCNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
	b=RwItEr8GH3DkEh2pNF+Rz/9X50vKmFus7eA2wEaeNx8Kg0haBf7Lt946JYb7KlupxRQS
	 aXLV1nUr7mSd3KEJunGTmSs5/IqnBzESMkIyJDE2sYB+99xN9s3HgcHlcdEAWmFwa9ASN
	 JIDdTx/S5ZBcIkMOn+0n/xehT9f4MvtG2WP36wXRgokkQP+rAsDaE181Q4rODVE9Rs+td
	 ZMhlp/4EEovsGq1UyZtWcLgd/SGL1nsZDLaIB6S3qfv0wEgktSvIqnxtE964gEnHNNIlq
	 fu7M4fVp+uSKAzdNpzN+dnPi2YRYl7ZVlEIstPf7Xz74mO/wi2Awld9wHvjA7B5y3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD4A606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AD4A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwAX93074867
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcaOJI2AGlsc/iw3sTAv3zZN
	ex+qopC3DMZYd+jAZ68=; b=Wp+k3qrIh+YaEOH3QJzYJFTiZ7PA6rrOlmzaK3Om
	g0UQtEA9Q2m329GTlC66MyOtkGxhNan8rDYhGD29qFbh3ruypWMjsWZkeB7N4V25
	PVDGMXx2FRX7zkhbe8g03lJrugJOSeokhLe+NQBkLkKWvh6ZTmhF7FVg3oz15MSe
	s4rzCO9TKJi4nRt5HmUeuZ0tN6IDkXvxQuJo4rmVXIu9B2t9f8HzvWqepL8RoPto
	DKIgDkFd4WL6Tpxvo9UD7qZ+fgYSJgdY2NTb/3SDs4Fl3wdAx9GD+VF+JXynZlfz
	97b/FgepqeH7Za/Ssajp0IW3600ju/57XVxoaytBKsXkCg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdb0p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990c957f129so4232100241.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027082; x=1793631882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=VjmFmoeX1gIg3U1SLoYXjP5pHsJIadjcDDRtukuCP6P7oLFt001C33ZLvqCA8ksUhf
         X4UITAixns5Ghdpj0oQokP/6kCyKxEIZC3St0NjOjOIN2QELdAddve6BGdE6HyhKF0dY
         lr/lLKpMIp4CvVmBWWByaoja0GfjFgFFuJBBtCHdX7hr1CIM8j135sK0lks7TnKhEs0U
         4pPaf6UKbdaSFLezt3uRO0yR9FX+3eETUKaZgV+5qJ7Hh8MPTN1DXQxk+jSIxx0bjvpt
         zAX+WUssAVM2kKHFHv82pedZPd6dUXhXzZP7eYkFPrBiccc+Q22zIR2CU3RSAcpHYBf6
         GmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027082; x=1793631882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=XQ+RsakO9vwtM+oosCLywnBLe6GuIj1gnG/6WMUVrM5F2kS+nGs62JJvF3QPymb5uT
         H3mTZh8r30JNJZ/qls0mvIvmU0HZYna947ylkj7oZhuCpEdL672yn6OAu0bAlsl910NZ
         +ua2T+9/Ywrdx+/GtZLBLsN6Ihffbq+M+nksgzZWDsU1bIx1WcHVJvUWpeX44KTDd5aV
         6rS1VYa8K3RIE6en+JOvkR2eE3/vQCAd8cHR3lHQv5ubCBsVLRrRfe3HWMyypV+ghrRg
         KxFK9JP9Gu165L+nUIhyLY4B3crS2NbTlvOVW3XOM2CkIFH1BmGb6lfwyU2xkbtKnRy6
         3DjA==
X-Forwarded-Encrypted: i=1; AKwUvBxQNjCucIOQs5g3h/ZOPr7Hfesum5BFMbGGnBGVjJGGeKKO5nA6Ym4YA46SzZTrGbFFCiYk8LuQbG3r@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6QltQBbXsZz+xa0qs9cCVShzvKkTDDcOc8rxzkuGUcX56LVUN
	W/3VwC5FHf/uAJxnChQ7PfbIdRmcQrQlQeewTdlYwo93r7NDwWzk+XoIdUpWHgswA5MrvRg+dUA
	jRBZE8w0u9fCKg+Qo5xRZgyeeVJ3JCEYubdjpiNzfEka70egJIGiB5jI41wiJ3Nj8
X-Gm-Gg: AYBFou20LrwQlP0megKiZYEA0eqAWv5KC/fbl+ezwdQB9z7s1k8b4ZDvY9Y5gohHM3L
	Ng7S1xcagHgDdh/XtqTrWSSxWFKuwWNaIu30HsNPa88419IFrwXcbvWsd7GD8VSrP81Nq92k9sp
	TDjPW7Qq1vWskTAayhyxwutppXKPMHfCqqaGTK20RxTb1FIW1NDqxotegJnLmJop5vjMFiTikyF
	0oqHZfttRtzLyWK1cM3TdQOXIXU5dlXHX/TrRFa7ujh+wWw0sxHvUo3kbSA6fm33EDh76VyCnoh
	YdjXQ/5IoRUni/kc7ye/lGD8PdowWQZwHEB20klXDzauyhjNV4kKmAOZzv97+KiETaLqjvNbgUH
	NuevTgJLWKTjTodRi
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188363137.13.1793027082091;
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188337137.13.1793027081345;
        Mon, 26 Oct 2026 08:04:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm200370845e9.8.2026.10.26.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:04:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:04:38 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
Message-ID: <2zv6vf3kvlb2k5oopypae6fby72ykqyg4pb7mgiomzyptolez3@namz2jhghdgz>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zhyyXT0KMa7PhJxT4h799ff_T-WOpHRE
X-Proofpoint-GUID: zhyyXT0KMa7PhJxT4h799ff_T-WOpHRE
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf6c0b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=X4WHrBvVKYo2O6Nn5h4A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfXzu07S+eGo6RJ
 xJOs7pu2zQ+bknvrtOOdvMDJHrMe39wDQUQXFsA8aFw5Z5Iic/EaG2+JD/ezQjh8liIsw68A/xO
 3UPD4TtJvL9MGIcwoOVyTNIYGagpFaI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX/1u79IqLD2Ug
 1e55yCK70vMzl70/zq6ZicMxtymOCFK8RUTo7vqoICW+FJ1ZW78f3ugxwkcq3CfDwNTnmext4Er
 en9OyhjP8WvE6qqGGDgELZFF4KMyA1yDCT/6s61wimNeNVLFZMK2/Xhf7rPIxuRXNd2IKdp4pUS
 20sddeQQws/0NvdN+bvm9eS7GV8rWcdwBCjmrg8+pPUz7aa21j8DCS75hOLEEjC/1jwhWQywV+a
 oCezlQ752snPwkD16FL2aSnaOSS/w8jsCtv0gtohwrBlC0H1OsfAlhbzOtrPdtI5aKMGw0BVD6X
 03DM5RUdi/tYefp8AaVAZOH7BTe0tiqDakzvS/reak3ec3aElhJ08Nrtmo+5ycwwLJF382//TSa
 wf2cLqLEWmplCmVrgQ0IXvq8gBpog2TUz+3kFbdWVvb/aPXlCUBC0zmG+H64dQyKdaKeM04tuQq
 ewdR9cIobxI57rnTUqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260059

On 26-10-26 16:59:30, Taniya Das wrote:
> Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
> requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
> GP_MND select the supported PDM source clock rates.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
