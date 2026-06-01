Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078E5306778
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780313508; cv=none; b=R3sRIUIzM3GKKfA5xKYgYGWPGinaksBvmKDigP77zTjld/e134A7yQW6IeQIQHHMufp0GQvQ/qGy2KNbvwHgNISZbv8nIqDkb3xzI+a688ocSvo3jmbOrP0vl/okQkZzLUON8j06lTwH3YvJQUiJRyNrxJhvMsQb8SrT5GpqQUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780313508; c=relaxed/simple;
	bh=CMCbK4GBOtetUzOVTMPXigvLXYggmTaBv77AMOXmYQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pN8CpsZ4fYccsiDMluL151lPGVtu0mFn6HCcK0tiX9KGyPR57+lTjGaHgkqKWhHRTTF5/cpltxofBqKuVyyjgs/Y2ufSYl1zfkqXnU0Z45oUmakbiRuT2wv/5DJy4mr3MVOPAPgpjPqN7mlVnN09uPcd1aRgcHgEGN3qqrupPZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsZUh8jt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITh9lqgx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsZUh8jt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITh9lqgx"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518f9bl2740432
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 11:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=; b=JsZUh8jtnEvvs5GW
	jmxTVtxFAf1no+JrbippW/yG5S/T9BCf06BcR6vYLOuYVUCp65jOzR74+Ju3sMBM
	B4/KyB1NXLXfTarY9X7D56ZpeYf7oMgzjT5JRLupYmRp5jUMXB/ybyTERp6h/EGS
	P8xFu9xkGHmoF1tQMbnWBZnjTRMPDNCzSaLPa1RoyZAMSRtEIPU473o8WZgWB89+
	r5HCWy0ecK4xPGwB8eBODTnQLqkRm+1bw0qxALND8Onci0KK6ID8kXwvbaz3HQWN
	qLZz+gV9Y2lYYrcLr5RBo9R1EQd49lDROaVmDHZMgH40tjHC2O8gckT5rtVx9VbJ
	sEnNXQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sqgnxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 11:31:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ebf602dbcso693649e0c.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780313505; x=1780918305; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=ITh9lqgxbCua27O9/EObQvnsT/zeJ79Zbo1FTPZ2N3uRyCGZPcp01bhQNAToFftEHS
         pUm+3bWFiq8G+GTzJ7RHID1b2wm3/ySlqW30IXitsG3KBfJXPIHGqtFoUriCv2n4CErV
         90QjImFA9akwJgX3NHZA2Pg42JxsPUSpQUu5C+r7jzS85M7QcnhXA3dIeSp9bBcP4J4B
         h4rAZ0colXgYJBYPdldBknPGF3yrE8fXCadwESzUwvsS075M93+HOEDXNqEfuC2vvywV
         kti5GXAz89JH/WFgeaNHjsM08olFC47V2wLw+ZIOIEuO4/qlH8mKxiGe3g+oTg/jiQWo
         Ivuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780313505; x=1780918305;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KNn3eBFCqh3QzXGSL2O+S+DDaMQWJbT1f9codb+9lr4=;
        b=d+AhBYxyY/iP9wMLKS3PKu5Xczg3eWmisMk9sMH4MO1py7mAki5Gkzlttcnkak31+y
         dC60A2hqUNniadb2mg7spbjaZLMbGlYjhw+bSKtFVBzAl/w8kzE69QBpAAL3LPzRizAF
         ZOaaL9D7TsTkh4sDvtigvA2fpHV3/Zen72+y3jBP0NO8NBF/Z/Te5UxrdN37wxQ06H7k
         B3u+N6LE/dvl1EY3Y5Ucdyb2WwRctd4PcGOoM+DzX585hQpvGL6H1LFv0Y6NjJDbfLW9
         +G/l9sApOYdL8DqnFE7jSYCdL4sei+8vpbfO8hY1f9Ci8R8DQXw1WYoQnKNuGzK5SahT
         ez1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/4rJT3BWvoIjAHXTR5GEhPcpCcQEQKNs7NrQY6Z9ahHQeq6L3Vmju/u1vA2I+M+B3O+yKLZ4D5vPgd@vger.kernel.org
X-Gm-Message-State: AOJu0YxgA4ILq7wDPD8aHXwZG67meTG6xtdcfN1DxrFlaJ7SiyeZh7DN
	zc3IWeQhqRCQJr6zZpmJ6YDz9DplK7eA35nZHDB6BGZ88Tw9u7cj86b1cs4JWZZH0vDlyIW8xvi
	9DVaG9gkyyXK+gb79z3WhalFZTLLWeWtV60ah2rOYxO0BlevLvPMSg7pEen42TEvW
X-Gm-Gg: Acq92OHmWISoBKdUIyaaFnYCPii74suTsZ9bnbrvfMSFtRQ/VuRkI0OOu251ggTmKNg
	1y7vFoVq+FGIhBWFCssqErKUEXzGHPkRj94yc+iSAwE8ncnvxvyG+fkZDONcj7QZLv/yuuXUxHJ
	B3ajM9aHElyKYD0rqoAR8GXTo1E9FK2vJ+z3baXJO6H+eeOhnPuDPdp6c6IoYJizRZAeGxhCAXq
	22KLl4Yrd4q/QNcN7rb/Ne+ihXhG9AgA0U6ORUUkrXfpd47g/OjvSgErFiiJgGAkDpAbfM9jpnN
	hJI5DFvY35Q4/Mes5HPKqc+5X5aQ3ux2EDWAWoxjsSPb+bassxlaCRZgkUcVfwOdT9bah1qU7A7
	BYIc+DcdIDnEH/CKL/YASjb1W65G5oYXAvBPr7VU99R4gxgTXcJkkwfaYuewpa72A7xY8ZWx2U1
	qVI8EH0kcUYJ9/26auLnLxHSBC/1pYAYqCRIaGTauHzCUWMQ==
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050645e0c.8.1780313505313;
        Mon, 01 Jun 2026 04:31:45 -0700 (PDT)
X-Received: by 2002:a05:6122:3207:b0:575:360e:600a with SMTP id 71dfb90a1353d-59bf1268aa5mr4050555e0c.8.1780313504812;
        Mon, 01 Jun 2026 04:31:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa5b07c2e0sm1977344e87.32.2026.06.01.04.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:31:43 -0700 (PDT)
Date: Mon, 1 Jun 2026 14:31:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
Message-ID: <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: vHea7rfQ3aFAoWm310fsP6wBBdqKQe5K
X-Proofpoint-GUID: vHea7rfQ3aFAoWm310fsP6wBBdqKQe5K
X-Authority-Analysis: v=2.4 cv=eqnvCIpX c=1 sm=1 tr=0 ts=6a1d6da2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=rVSrNolec8Lwk94r8HgA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDExNiBTYWx0ZWRfX7xS5TVJ9mxHn
 ieUkExGltIqHfLFIBTfB06TubrceQd3h3dgbIgzQyKP2IgEwwO5uHUtH3wae0Se35MOkKjxF7Pc
 2kTu89pMZGtKBsmmMPAxjnNALlaaFi3ErIXbDWrTCtM2jF8Da0MKP1ZHvNROloKPx+sCjBh3MTO
 ZDGG6E7QpKbC6CX2onnOfC5tEl5SdYlDm2x5e+AWQh04E1cyLnB+BWA9zQZ7KfY7CnG3iMuF53a
 fulMyr5YnlT1o/lMozgrDBb9ta5Y02cZRPogHMNVdILDugoQYHmf12Ymfp3lF7QYfPD5Z81K5/g
 yhZ3ARGLlj6gK0yBggl9Nu5OvZS4txtGJgEBcoaLgnJbrMe9G7s/HuQ9Z8OAfkJyS1nkbvVC9SI
 1O7DCZLKIS50yHvdiruajqj323kQSW3pHuDJzCItXCfEMpIj6/eBcBL6ULjuqkavhQHCU2Qa18F
 019pDMwCJdkqXhGCyiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010116

On Mon, Jun 01, 2026 at 04:39:12PM +0530, Nihal Kumar Gupta wrote:
> 
> 
> On 29-05-2026 20:20, Bryan O'Donoghue wrote:
> >>           ret = 16;
> >>           break;
> >>
> > 
> > This is a pointless enum add.
> > 
> > NAK.
> 
> You're right. Since Glymur reuses vfe_res_x1e80100 directly, CAMSS_X1E80100
> already covers it. Will drop the redundant CAMSS_GLYMUR enum in v2.

Is it completely compatible? If so, we can drop the driver parts and
make Glymur fallback to Hamoa.

-- 
With best wishes
Dmitry
