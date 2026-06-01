Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C881437B028
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318878; cv=none; b=TpYpthLUc9TVrxpcSoGyMQKp3mqw0XFDgNawI3TbhnZVszF0eqkg6sHDJmq+RkOxGHcNAXWlrIRiBroYC8c+8gXQkjTyeON4xQx5mE99AegEiw51Jcve1VUlaTuRmPkoX7qLIjiZk4/FDxXCDkTdh9G2i7SC0YtCWO+Yjx7aByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318878; c=relaxed/simple;
	bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sRcvBEqZrGKOsA/CwqBCFslcDXqgWSSvqFLI82aD6j+N2Mmm67wPntVXLfhdjqR9denXf4wCQ1Hcfdx/5mGOdmsHWP0zD+3p62pPo1eFTAewyoawUC4+HmEyBARpNWvbSkiYjlcYPJcAeef1Xchx/zDL204VbRmpYn3DUbXweB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BC42pSrj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEee/TcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BC42pSrj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEee/TcR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6519Y7gP3372681
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 13:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=; b=BC42pSrjgjSCSHjn
	KmPLCceiXWU4HrTBGGIbiTCKI3XDQTpPyHQYyr+Sxneylqn5jA2DIstdbc9tAAGR
	nQd1hGUhbJeoI+aCN2iufghJd/bgDuqn9qmVRxhnhTYJX6eNhFyzExv+5hyaWXHP
	nWEtTkoJAjkjG208cuKXgUD463y1f36b4KbCGrWVeqLEQqqwSj7lNrYq+H43Lbal
	l/KOgfvGpmFbc+2YlfyB2ThEbaMeGxMHfg7tdYB3ULB0KbpbeTVaLzVSU7tJCBxo
	Lf+Mk4wa+w/FwgGTS2fLUBvNeKd38PNPcUTXXJLALmMyPo2gBQtNfkRaBZ/LUPnZ
	H7vnsg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh7jh8tkx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:01:16 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8582b167f7so1225798a12.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318876; x=1780923676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
        b=kEee/TcRRAGrl1yR24YG3q/m/2yU3C0eHgI1z80dc2VbXtEcU7m7qN+Y/M0t1ZfG2h
         H+TVWWw6DirI8K7qOpuJpcDEC3Fl6ZDtQK8c1L5EN7JiathkUr2ABuA/LvdAXrgiuK3c
         x13gjbY5glTnt/n66QRAwoZsoX7XvOdGrEuhbeWxv0nbvt4uQiKA6jQBPgIVI7m63CuG
         /itFDOSkqcS6Fv7WKuEUa8CVCfbX5Zl6eGsHaJgubQoUzKP6U5oCCKOyuX6rKBbOCeN9
         gn1JkVmbhnh8XX75ONMuqwt5etDjLUHo4MiZ5Cc8bB9fDp8cIAOia3Lcvx97BO2gREIs
         1t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318876; x=1780923676;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmCHox6K4Hi42kXwKs9ySW3354qUoc6q2Mi90mLA92A=;
        b=q5VkGI0TXrPmUONgeQhjiPveBWRMiJHlMIOItNjUncMplAKman41WBFDU/648epjw5
         quPPtfDw1cPHOWgr2n9oi2CZFwI1OrolUINOnAhSNQDs2t8OnrWahqIKXQi0YNiUTRw9
         WkT4kPjjw09ZPzPnvslh7h/a+lMuEFWe3IJxKr/p7gpS6DcOt9Zz95nrRhvtYbn+fWBo
         Tnhh/ZYEO3G5qz6tSWEN4GkzI6OhGN8U5jlQdFn6H2JxZudrWddTquCWtnEd8TLUOPT7
         7JrnCIDKleYtKc57/SIXFDFRgsfjvrFHf7EI7y32FO5Db7T3Jd0kCFPvo4Ri/M8GnL8L
         58Lg==
X-Forwarded-Encrypted: i=1; AFNElJ9YZYJrXWsej2iGzVZkYlgGqACkPjvoYoCesQQTw5s2b5G1P/8sqws1QyAn2IwBK8eDOgG9jVQ4mIMo@vger.kernel.org
X-Gm-Message-State: AOJu0YyBJQyqc5BO6CABH1AwdKYCK8O22oMTzvo+R8mvhOgQYmHbw1+V
	We6xVNNM4CgmgNZbinJxd42lSEzppLsCYMEeGwiJFJYbCrZBtdqnbxahCh8A5QqHCJmzE58itQq
	lCPfdjHJvvTLk/Q47eL47SH6N2JDgg+hgwX1bZB5vTDckJMs5bPfhM8cpaTW2Yrov
X-Gm-Gg: Acq92OHtgZnwFJv38AylemBb+c8uVzLWfq/w47vNTP92azyzk0usa0fNR3NAT0L9GVu
	JzpnQTh+iijZTjqd7sbW9CIv7ZhuXQBIMSp383FHWuTrXXxYsGR5vFM8jByFLa3U7Q2A3uHlh1Y
	p5+bXnEFh6Kn/ODQs3YIQ34IJn8I6nIaDWat34YyKqF2wlN2FMsm1XB4pz5C6tCxZvt9ddAkYTd
	P9GLxTXs4iHk7ZfASnbFmBvmf4LsApjf9MzDu0Lm7z/UW6JL9tY8K1QVzHOoL6F79lO53lhAbpW
	IL/wZ+3+mxriDY09HZu+TFtpbLL7ss4N0iVZMVaRKLjEl2aOcXtXNCtpdr4QRdXYNLYENWR61BD
	AlA06PbKrtrSVq6KVVkxpVUDaqtwyaJDthy/UmuZhSNP3XFqSa4LQBQjx4AysBw==
X-Received: by 2002:a05:6a00:91e2:b0:842:2cda:7aa2 with SMTP id d2e1a72fcca58-8422cda7ea9mr7765479b3a.30.1780318876133;
        Mon, 01 Jun 2026 06:01:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:91e2:b0:842:2cda:7aa2 with SMTP id d2e1a72fcca58-8422cda7ea9mr7765356b3a.30.1780318875226;
        Mon, 01 Jun 2026 06:01:15 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84238f1ce65sm6219909b3a.5.2026.06.01.06.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:01:14 -0700 (PDT)
Message-ID: <3dd46660-b01d-4c00-b3d2-d0f1fd1e4fa0@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:31:08 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] media: qcom: camss: enable vfe for Glymur
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260529-glymur_camss-v1-0-bee535396d22@oss.qualcomm.com>
 <20260529-glymur_camss-v1-5-bee535396d22@oss.qualcomm.com>
 <449651a8-18a5-40d2-bc68-59223dc8b69a@linaro.org>
 <ad3e885a-c04d-4e78-a037-63ddfb0b9c52@oss.qualcomm.com>
 <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
Content-Language: en-US
In-Reply-To: <7clwzl33xumipuucecv5tovo5mfp2dl7j6v4wmvbwj7d3o42yf@3srv6pzfldhh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fUU21y--jOdxkgPSHrOrUJNomrYhnzbf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzMCBTYWx0ZWRfX3oH82vP9kxy0
 splGhhoSUlVk7ErRBQix9N8SOUmVtCFNRdycvLpdMW4TInmeSC03+8AaK4+Rf5QGLP3K/7y2wwm
 hBOfSj6IL+A8ZvqozD4mbCj7qBW2ZS1DPzB0M5rLYzRjgJOuCtayZ8fRY9677CKMx6Quct8luQI
 PYM/hOURM0tYBFkhr7imeIUHuVo0D8xJUX4dyV3YXp6PDFSdjnTdv2NNQpZMhKuke8AvEHr3JQv
 09jRVJvq6y0G52HWYkMy/y395wyOTRsyAY5D1xNr2nvVk6XMMHWkHJ+dSi5fGvQjjM3UUiMvhfH
 J7kBwQo2dKnfR4Br8rzio6UYWtyYCydvCP9EsAjJMY4EEjNKTIoZy72BtbmbJaHoVateAwQ3hy5
 JG9T6StZ16FEOtrHznxq7lhVEG4lQIMks/V4VbzUj0IkqKtuKoffOp2p1Jdv0XYsFiHgNKcAV1S
 Bdc49kFELhvJYB2gbQg==
X-Authority-Analysis: v=2.4 cv=YuY/gYYX c=1 sm=1 tr=0 ts=6a1d829c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tZ79QRyfKbC4N9tKgJwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: fUU21y--jOdxkgPSHrOrUJNomrYhnzbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010130



On 01-06-2026 17:01, Dmitry Baryshkov wrote:
> Is it completely compatible? If so, we can drop the driver parts and
> make Glymur fallback to Hamoa.

Not fully — Glymur lacks CSIPHY2. So, A direct fallback to x1e80100 would
probe a non-existent CSIPHY2 register region.

All other resources (VFE, CSID, TPG, ICC) and version-switch paths are identical
to x1e80100, so only the csiphy_res table needs to remain Glymur-specific.

---
Regards,
Nihal Kumar Gupta
