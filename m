Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74483F65EB
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371726; cv=none; b=kPDO+YPYaRgJcXPYaN/Z2aV4si0KI5gz4INjE+21B85k83068P+ON9KchhyJi0n7OQZbZiAqr9VAZ1FrUH05AGLG9UzBQel1H22p2VyNuaHv4/AZxg1bRATXDf/I+3gWvIxk2ufK9jEhSUp8NOpLl7kGfxq8ZXeNpLvPLVi+rT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371726; c=relaxed/simple;
	bh=Q1hokslqC4SYT32xlfEvZcsFs7n/LvtyoimUL9fjew4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZVbCaLipKwXw2u71FG8iH2tNhqG5Hrn6Mjv0ogFIy5bfuJYV1SEO9ajMD3+1PzJR0GMlDlyg93rFhkk9BgZnJYMjUZv1CXNo5CKVx7ZVJB48L6hHIuA5NhEeQHC9J3d6gaw/jJ4JQjSVcsXOTztlq/gzYo4S0gfUKElwUyLshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oWvRmRaM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VwORNF/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oWvRmRaM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VwORNF/6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jA1A3370001
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wtZ7FfvgKDC5aBEfkDDN2hQt
	g3jzbMYVITQbBEDJAp0=; b=oWvRmRaM7qi9PbKSlJ5C2aND0c6txT4p6bV35XAs
	u6DpUhPk5ElOan7Xhw1DWJvp9l8YhI85BaC8KQwrHLR2amIz9SxDHc+GSw77t0pG
	Dd0CPp5WFDtyuFZiliCs5SVuo8nj1loBpoA5k81hgh5rwEmbGKpEWEyZA3qAtns9
	rqr+IcKuYTaUb1gYDYW+dvIR58kEkZzrHWoZNPhiXVRf6eVmj395+1IA7pJfUKu/
	Svubu/1fod3Ja5wc2cfW+BB6h+8TEb7evF+d/UBOW67/jzXDrmJEXr5oftUxha8H
	GgALDhdHeSWXmiiJuMQZCnyKKow++nXaI+kir81DJwt3fg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5k58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:42:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso178666685a.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371723; x=1789976523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wtZ7FfvgKDC5aBEfkDDN2hQtg3jzbMYVITQbBEDJAp0=;
        b=VwORNF/63nqgpZa1LbjV5aMEpkA5DuAJ/dA+6Xb+1kRkOnKfZBmhRtOF9fhXtRcmIK
         Q5GZ+BJlGzIQS+Zkd2Ny+MREb7Xt+xA2mz76/dIVRffZu6+UU+rjTIRzA1dsa1aKZ+Hi
         00SEcItoCckNHfxXOQ6Ok+KslCT9rOAyS8YeYepBoyDi/1nyCEw+f5psXmZK1BRrOlBY
         5avbXpFh0EA00Zo5W3381Vj/a4qwSSMhxlc29BFN3lXo3gXfeyBsoxLOfvVj7VWFpJZW
         C3ON+NTxmEGhpFERtvGLmhfMU81bsG7clfn3DFMQnvXwH3qGPMe1WNY298dl/jfbHr8z
         9E/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371723; x=1789976523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wtZ7FfvgKDC5aBEfkDDN2hQtg3jzbMYVITQbBEDJAp0=;
        b=N38u7QWds0aAaMioS+iGGtFUlPBE16H1xeK7eRRqtOVuUg3FqufoId9Ynm/n3voHzY
         5qc2SLH9qc/cu/DnyKEAw6it+FXRrc0CMRr4Bhwr1MkffepcX9dzx/Sq1fFFfPLyPsk2
         i4y5hNA+AuPfCyuiOybC/Y7AoD7jxrrOEeBzMKcpoMUVl18dDY7D55S0ec+l4DijFSnr
         MPrtOKEh5pRonmpcpvFpTZwJtR6pjZZxGtnL0uDRec79DopiAmHwjk5wNMckK1LKYAAy
         lCMeczKQ82eU0s8yHQ1gL2yJzUWSMXUPaA70Gv4wAxqdYpB0U2mbNzGUcKTY5f8fylid
         YlEw==
X-Forwarded-Encrypted: i=1; AKwUvBytY7ZgvzsLVR0lJYC3dm+9P8zNAu5KXWtttIkBZG/QQ5rvKlC7ieM95wN2Kj0pU5cVebiXmALBAFL8@vger.kernel.org
X-Gm-Message-State: AFuF++m4GsFfFZ6pJZBrKwh8dmEbCs8jm7yIA4TGMdqrf1NZykev2zMe
	SzD8QddaQyOIH3mkpCBtszmVaoFdmil6wGSEJ58ZWBXpGR3MnAGYKQVoaoLhKGEQk7UFlquvTMT
	vPkN2IQWvWltJBdHf5VNxbMfJymGeoSudWALJ/GXSib883Loh94AYw3saWUtp9HVa
X-Gm-Gg: AYBFou1fETK+6JQhW9KY+DyiSZOoyZ4JDOaPOQ8rkMLEzuhIl0xAevPaFyhznp4oXlY
	2IjWbIalcMCv7oDoGazPzT6VD19/dHccLWMdyKjFKzk/Ze/n3qchF3o3pbW2Y5dN/tkDTuoc4o1
	jEWSnptLBBNyTnXbeDZb0mpDyqni0NphIKB7d2/gqJZEjaGzJxUpCgWwptC5OJ80ToQiH95m5/f
	vkG/BTE1BHCG9FMTKzRaG5ZDx1neXFVBQq7xazSjfMB6Q+ut6DMBr2/2xZaXbm6n2UHDphJcd9k
	yeKs49LgCYu5VoP3mXG+t42rRG/u3QpwB9mqRDRAsitfOiO1+C1fqJE0t50FKwzTKx/ceGwROVm
	4CQoKzQhsJYyNXtQ=
X-Received: by 2002:a05:620a:468b:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93a298590edmr191413785a.18.1789371722864;
        Mon, 14 Sep 2026 00:42:02 -0700 (PDT)
X-Received: by 2002:a05:620a:468b:b0:938:ff8e:cd0b with SMTP id af79cd13be357-93a298590edmr191388185a.18.1789371717600;
        Mon, 14 Sep 2026 00:41:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm26465151f8f.23.2026.09.14.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:41:56 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:41:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 23/31] arm64: dts: qcom: msm8916: Add domain idle state
 names
Message-ID: <my2qlwuuctcu642konetwz2pcyvtfslwrfab7wwxn37kbfuxj3@3lingekqj4qu>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-23-660c31187819@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa7a54b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX1EJhVVB/Gtq3
 JIa/cUJewMItiMGSodeqOpuiRgBY/gcO+0+xe8RaL9h6sz6ndCKWRh0NAR4ByhnavW72GY7/H2c
 LIIjvobvr/dpselVrF3PzThjCcGESJQZMEmHuOD0hGhf0Kii7HWqqefGobgcDir5jNC/P3cJMEM
 WSbEdJcM5jaZ0cQmyEmWFVgAq7xIZTwM1AGHCDOwZoHpPk+ANOSwdVFoSBHXMKVnvBplW8lRZ5G
 rZZh6om0PaeUkopUXM8/B9Zp+K1J//X/y2MQOlzkGqnnm29Ip9OJygZkwSItJQpZeoNsyfj1rkd
 dF0L65GV+1lpCfEn1p1zSi9YizIYwT3049b2IxpPaGH/sDl7lIQpAJHOtgu25RQ0oaLZW09rurh
 rs5eS0Ys7s6yoqiEa5WhgbZlEvof2GzBZ2WiD39IFiASxgDju6kfOeamJdCwl6SmPanqCSU2ME9
 XgBhnJovU/aRgVb/8rg==
X-Proofpoint-ORIG-GUID: y3-Io-vTfBNV8_uiReVCB-O2bXXQjf63
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfXx1evLjTmHKgv
 BoKeP8anlDC8Ss+gAk45xqTIwMKuWhGda7LbvdtOrVZTFLsuUAGhSqyaiS/HKQDMQ9AyiP8NNUB
 mqAxUYkBsbDvntQAM2NQ0ywkuw/o3tQ=
X-Proofpoint-GUID: y3-Io-vTfBNV8_uiReVCB-O2bXXQjf63
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:55, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
