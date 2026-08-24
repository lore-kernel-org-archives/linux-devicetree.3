Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBA3F12C4
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562686; cv=none; b=V25Trb2Y+3BzJS89dOruUGY3ibVqbyoAkDZUzzuyD3rEcK46EZ2y0cBg2ETsCgQ43e4aamGeI4pkoq3bUo+4M78UIq2hLqBoK8AkO0+L+IbzWUoet5TKhXyn1Pare1Mop+o1icw8EDfF2dqLnsMXeRPvLD0LwD2PDKiEgaj2Voo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562686; c=relaxed/simple;
	bh=g0dFoOoOVkLQ9cnrGuwvqmwMtmuK/m38bMawr/UsO4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZWfkYFDD3z+ASJz6udtrMob058NJCEMAXAqhaTI4N+Rqr1a6q8gZCJmJKKM1y1ACSXiJ+gOLsQVe1gnomNHNF67FvWXVMAHAJu7a/bxn2sXWpycExLD4h38ouhYfimreNp0nPYKektSCAA5K3AOmtzvDPLe5muLPRRT5DiVLxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iaYVUmNC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cvTzEd5u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iaYVUmNC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cvTzEd5u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99IOK2083097
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=; b=iaYVUmNCqcLDebGP
	ipwIrHMOOqCojuznR4LJz5oa3/Sq6NPMpRhVof+RFp9XRXwEPAxTcdEk3yVtbcW5
	rlUwaEd4p7OQqliua7K+JVMSV+hmljHnz5hF4cVWRwSobql8yqNmVbIotQs//hyU
	MHQ/eWlB1cZ28CUAvoECWiJjwkRivFGWn1Wr6gDnTuHzV/tQEfC5Qtd6npeNQz4l
	/1PjYFAoCHA82kFljVPQTM7dE+7MNPt7nV6UbzA2evbZmaganAqoViz0AW/x/ugm
	NwLeQzwhJI8M41+edMAksiwTl0t4mrHe7Cnq/hJIHHELl+EwzDrpzbvNmPHLhL4S
	Zw7a7A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hbtgg4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:11:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51e9d892f0dso7607581cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562683; x=1788167483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=cvTzEd5uJg1jNG14v/zB8BSijDelh69Y1u96UTDzALml1uDwY5Ep82BlB81T8t8vWr
         mv+mudDhnhWqPSJXixnSQZ3mPhKp2J6oxjLIvyR7R+XvHQ8ae96OQ/iAgAZl4udSZVuv
         IjDMf/ZlNTt5upJJDdkJqzjKtaSjGHZjqs3/tGde/w7PWr3GuEjKZ5Zdd9Bj2Z6n3h5v
         RH8WouFaOjeq+057e93Zn4yvxr8N2Skq12BrGCMhxHj380UoWAlYdi51MGJWK3bu7mRp
         vYkZqCHidtkPFEOldZKPmf76SSp5c9wnj0SrnLcEyVUAUH9NicwIuo+j/gBtRy6W1Exz
         KLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562683; x=1788167483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvC1jL3A4W1dPjMTfsToSXZ8V8KQjAtj9niANMBIZp8=;
        b=R3fVIXQ6kKrJY68+shMQqU69nB24DtJwuNeqs7JJq9Xh1rF8FtiJxcL8P6JL+yzm5t
         roKsQAdV0SbYoeWhY2OH+OTfOeLlTKQ9Cn9OShKxyfghyk5GbPS8AwRumkSDX28dh0sR
         6bB1+BgcnlrMZDd48rszvFXtUDRQHhq4WjE9j/XYuJFpEqerW6E/yFKhygZv/3GT5FqF
         0uXJkYd+tE/OwyZPKmqbHa1KPNk/rTaNubHF5vGVQ6CzvRiR1ugbOTSlOA1awbRDdegD
         yZ6zhaoRyuQDZ2pWte0hSNwG64GwLoxQeT8Q0EZgVnDVquC3SPkAHSka+e38yyKt75nm
         V39w==
X-Forwarded-Encrypted: i=1; AHgh+Rrg44ih6TXDGcszZP7BL781jLdkfU1NPqfL4+ZbvR0rwyCAR+NYxk2h9a7GBML7G4ff25G/9abQc5Te@vger.kernel.org
X-Gm-Message-State: AFuF++nqLQZpFBO5JJsQBA0J6k2UuliFI5enX7Azf9J29DU95yaJDA9E
	/hx9MIIpm1H1Uhn/NxwbWCNn50FZ/nVLzgodKJ2AjFP1TuJzMMA2lMRalnDnctLXhVMhp4fTtlc
	GxKtPiZLa4hoz6lcJKKNLyWkfdhwh2ak8kk6EqctfROimH+TLsQOtLViVI6PUDMur
X-Gm-Gg: AR+sD10FQD9mgItRVNYsCerccJvj4gJWguHnOZAml9kvASV/p/kitohsaf8ezDHuDEt
	j1oY3p5zVOerKU3s4C112B1JBEZ1IOhUWLRUkoFpE3osefNRjDZhBqZqbkLASFFWOgZy9E5yh6+
	k2UFsn74miTaS8bxitCRM6WMxFYoK+Zdwh1PpRE9oTJXOKf8VjtivhINuIENXmXNMyEAaVI0Lf/
	Wlrz+u/vSO95cU9fLxxLtlnvsy6sC35rGKQQIH3vZyYq6YJRZ7WsxoNmMteBGR0y0QgnRfpg2YL
	RuyF6f6hsrqjIV4GZzEW+zgxj+lDVGh9TL1v+VyBQil/MXABDWAYxEKho7UJq6if2+h51MpDaYy
	1rnvtVmqQ6k41vku3dPJUNagx
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666811cf.0.1787562683531;
        Mon, 24 Aug 2026 02:11:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1448:b0:52d:9a83:4187 with SMTP id d75a77b69052e-52df5492008mr180666351cf.0.1787562682994;
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24967459aesm1117153366b.48.2026.08.24.02.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:11:22 -0700 (PDT)
Message-ID: <f065ddd7-a04e-424b-92bb-24435f1803b2@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:11:18 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] clk: qcom: rpmh: Add SM7250 rpmh clocks
To: Sreeshankar K <sreeshankar0910@gmail.com>, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, konradybcio@kernel.org, tglx@kernel.org,
        ulfh@kernel.org
Cc: bmasney@redhat.com, radu@rendec.net, abel.vesa@oss.qualcomm.com,
        lpieralisi@kernel.org, quic_tdas@quicinc.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260819152545.3934-1-sreeshankar0910@gmail.com>
 <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152545.3934-7-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX0YCA9qSEX7h+
 Ex215JqyAVHi6RsDN1FBNGUDEFgHwdwfFoXj6q2dG1na8bV8PCTwiPMV6LjZ4oWC9yUOzVFzuIJ
 sbRFiSWFAd7enqZEIZ0Y0Xfxq/r7eauUUrHOXX1nwbtFDWQUNOUDiLb1LixsAP/quGHqwpimw1n
 PnUFf64Kl/Ue0TYJr6M1NzvTyFs5g+8g41KLc9wTX0fUa/x1aEE2Q2leL9v2h9jW+b9h+jI3XoJ
 iZ1HyNOqABnLLRk2Zpvock6NqxlbCh+XIYWi/sxePczsONw93qCW4hiVQgrC46iWdwsdrMtXgfP
 9kJOoA0g0zeTS2A7CTOE5YFoMITN5V8rb7Hhleg+BNFMyTYU0zserMIP2XpUaZvfaQLxgyU1cbT
 gcBUf4mUYr1G05SDA/6koSwxdRVEJM+SSpbz8/Ve8UpoA2Wksh+fKI7kpRqspGKusE+Pw5zCBLJ
 EoVFAgSt5f5MfE9Gq1A==
X-Authority-Analysis: v=2.4 cv=JL0LdcKb c=1 sm=1 tr=0 ts=6a8c0abc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oRK5wSY2C-ChLMD65FwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX9Oy8QJvd28eR
 zlYJgVXEzqZI8Vtf5A3R/CG/EabdYOw+RfOkHsxzT6m11WDZou3ECfh8tYWmaPnKeUILWIhEE9n
 PPsOxK5nVd02+ceDFo3osOC9/5uHICU=
X-Proofpoint-GUID: 8TQUHyBA0WDOvs4dUzwAKSgviUGyq4Vc
X-Proofpoint-ORIG-GUID: 8TQUHyBA0WDOvs4dUzwAKSgviUGyq4Vc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240079

On 8/19/26 5:25 PM, Sreeshankar K wrote:
> Add the RPMH clocks present in SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
