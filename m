Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3273E51F0
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647354; cv=none; b=gSXn17teWJc6tWIHe3Za5LQ9r60r8Ef5vyH4MA7oZ9X1QhxaSZosllP9RxwJq/8easqmBAh/A52qgd56czxrPvaEOBT9OlZmzvVgXwn0B2D+dPZWGmomg2VsFCS+7c4QyaBkk/0vUQoh2Sf+zdP6euMEQ8HkSh1whSzBtcoqsm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647354; c=relaxed/simple;
	bh=ayRTa2nQVP7hszy2MsPoyKk+f6EPiComELT6oUW1tjY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3yw3qJ85thSXVyTiCnVotFDvf2N1lcukELKN5KufPLmSMTRGV19AK/A9o3q5noSSSntz+6A3D6JGqGMMXFtzaAtB6OFFy8cMPGYmPzB/jDV0fetXwOX+j+HhxtrvGludzNjBYxz3kjG3kqTV3BAFLkkYHbfIGXkevtYzlZgJ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dPPeeGAQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jbLBr9Fo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dPPeeGAQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jbLBr9Fo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88MX31706829
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=; b=dPPeeGAQ6s2sr0Z8
	JGDhyBC9yVMI3iaPlTbnd3eYCo7OwmQaoJq9QZY1YF8Y1TNF+Nb4ocdc1IVqbKiI
	zFTUQ9aaLn/Tjbw8AVTD1bznvCMpVP/gsWzd1OTpJtGf4bsU+bNvPio19ft39YTD
	zfXhPe4eybxwGDfg3yDXzQ6/K37DZId1wlfoX/d3CEBMHWhrO/GChrzIkFnTnCWC
	UajP7ArieznSTQGrjQZ3NdvNIfyHg0wePvtp1gCs6KcbgMnmCCpuohgGcC48/Tmh
	LZ+Z/ngwr+L04CW2CQqqQKqEs4l25RfCGCf9oxzH6/z2p77Vao5S/vXdD5tf7wXq
	pfkJRg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvs10c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 08:42:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so100342085a.1
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 01:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787647350; x=1788252150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=;
        b=jbLBr9FoqXMufGonR/UhRLnoii64cstNgVK4eLt1ZJWvvT3bve8MTIFf8rP+F81Njl
         GRxydYTq++zGpm/0jTF2aFwpNVaUFPqCTmAv4G3AR0BBRaqum/3w2ou8FYCRC7uWVDoK
         9tDgBJuPJdhZQzIpc724z/42NmNThGXcEhwKuM9gvEPToLyztryGJWDHH+qxECydaDdd
         S/K/STZ1qdusJ/qmHumaBhJ+QuaphbnCVjs51j9IZYeI8nbmOFptt5pKsqHFPimdwH84
         NXRNTdg8ASEv8o3aIrkC0gIV9A1O9HUtJybtLiWFSB0T8+R5m7NBJKHBLI5B3h7LPfaL
         ZM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647350; x=1788252150;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lp+DUWM8yXhcm4IeP7nLZRH08qIolnoMgoT1U63h4E=;
        b=W6B6lIqwMg6UPIlpvoZa15C5J6FW4kNmLPIdJyeXx0LKk/AoR98klvCviMsV54P5yw
         kglz5VynCMLb1ccTOmxLgeyQKQY0t+TvZrWoO0esJAtyYys3qzM1hiYzgFHQMHhXS7Jm
         rQDz/qyRsDl+l49Pve56Xyb0Pa9bR+X1ElTqrLarZEI24yGgxk5t/62ZCz2IPf3JhqzO
         dpJ+BYfrrAi8Fv7jXHz1h9jzxtkrCamE5IBwLvZznnsNN+d+EhjNzGzwszenVD/zL9td
         3C8VzLKlL+vMu2h13KsucZPTHBsI7P8CtN1dL5WX5QRqKjzcJbmr+b5p5TZoNAXx9GpM
         BhnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn8sdfr9ukwoG6vVWZ5BGrYNDZy9ceDvyTCOilivvSg5nISU6q+e4Dy0/omm/SVZNA47r7eRIJw3nm@vger.kernel.org
X-Gm-Message-State: AFuF++lblRqt4AlkVptiX347o4+dZRk/pZBs7Dwd+PUsuWCwTStj2Pyr
	LI/OijzddpEH4Lw45ExP6KH+mZn0mPnzD3MwKqRnfSLuact05a+fwSLj0runbZHoui6VCIoWWGF
	NnzrHImNwrySKHti0+u5jnT2FaCIyRo/S2X/9tQOm6nserScD487SaSQQBY1BJH6s
X-Gm-Gg: AR+sD13Px+ZhLebX35ry95bRruNZzSHGZg/dBQ+m7jCdedconHDiiZEHoZmMDm90b5e
	Cd1L8JTD6C5czNsjt5DkoPkrN8eqvDiknC4jqBIgN8lIDSlCPfkBcLfpZVkxo2R4EVtKy1luSeH
	BdverOmchZngvPg7YAdAYvReEdAYuZ4FqGJLIinHFwCkGENNw7EsQncjpHkQiGa+M3mn2YRtpb1
	bpd1/pspGsZpu03jV0ocNsjcDcnAWWKDj4wm1NBaZrAIgxfSNuh9x/rOXg3qXceahylJQuBw80a
	p8shMhJzgF/qLvrcS7HfbPgjRKkyjFV+qq7AdkIvdONzcEZrOzuLq63bv7AuqSsPBXB5mAO4iLs
	S75fRGgw4KsWRNWo0K2C13vpU
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr2164410585a.4.1787647350223;
        Tue, 25 Aug 2026 01:42:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2806:b0:92e:6485:f640 with SMTP id af79cd13be357-937395ae7ecmr2164408685a.4.1787647349855;
        Tue, 25 Aug 2026 01:42:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249606b683sm1807087766b.5.2026.08.25.01.42.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:42:28 -0700 (PDT)
Message-ID: <26e39629-04d3-4fdb-8768-c93252bcc004@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:42:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 2/3] power: supply: qcom_battmgr: add Xiaomi taoyao
 support
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260821123711.1579539-1-zstaseg@gmail.com>
 <20260821123711.1579539-3-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260821123711.1579539-3-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MyBTYWx0ZWRfX+H58Q9EeOCgG
 RV7UTLotSKPvxvbOKtEsXKTvFStmZU4PRExn1xp+0kJ+0lPFFAWuI5vZEGkT03qLCAGRnM6l0aG
 EAu80npXAbQv4cIOvMqA+R/6QmR3lf7aXn5uWGPclxfY+OjqcAZF5g3RwYb8go4BtAkhYREhM+1
 +S6BqI1kAk/S0tdhat7EXngyx/RasHAHzq8eq9nzue7Yf5dbiwjPjUp7KQdSiyepB5FVIFpkZpq
 kNHKfu2JU6Oo0StVfIlyJIA1CEHUb/Hs4QnzQSnAUsaSM2/OExhQtZ+p4TLaD2bAytDkxjXyGVU
 a40OtuZ80FdbyGCPgtqoJJBZOg6KN6ZdOPtYNKTgqvJQdMSHfbHq86Kr/jcxypfssdUmjb8QyVf
 7oF9Pg0Cc98gQ3CcJAyVr0DF7V08xDtbYfTIOa8ef0ZBWnvVMpzbT7CynK42/HswYCUtXqN0nlA
 PNOmf7YhF2p/i1r2JyA==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8d5577 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-Zqg0uhZhYSPuZ5HblIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MyBTYWx0ZWRfX5WsMtgZCdWni
 5R5BTtxzMZZgxg08RvxpecM3W29WDeKRlnsqOjtOx/GuoTdr8mGpVnD3AV/fNR1w2ImFe7vCcze
 3IK4UlgyY/h+IKktz6DR/Z3gBkigsbg=
X-Proofpoint-ORIG-GUID: _M5SES7_FH44cEFfdEGZXQwn5s3IdbJQ
X-Proofpoint-GUID: _M5SES7_FH44cEFfdEGZXQwn5s3IdbJQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250073

On 8/21/26 2:37 PM, Stanislav Zaikin wrote:
> The Xiaomi taoyao firmware defines an additional BATT_CONSTANT_CURRENT
> property (ID 12) between BATT_CHG_CTRL_LIM_MAX and BATT_TEMP, shifting
> all higher battery property IDs by one.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---

With a certain amount of pain,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
