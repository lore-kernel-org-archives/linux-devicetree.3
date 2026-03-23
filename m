Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D40286D5C
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774265673; cv=none; b=J2i22nyEcQUxqyovSzsqGs7WE/KlCuexVVvtSyy8SmMAj01TXxLAExXkCoGU4p/cx4jw9Oq7rvdKB24zoecZ4+nW4dwetl/n4EamOF6KJ16eemb3MjqQPyx134TLz3Q3uwHBtcYR5tF/eXCzLRtU7rPlMA4b2t0QCDENAycZD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774265673; c=relaxed/simple;
	bh=5y6Bd03R9I+jDsejN2kyRg3MgRmiMG2aUkV/pbS3EVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ0iwm6y7L986ujXfnI276VWnubUYyzWhzGBlYVUNBf0otUNAa3+HGX1n4etFWCHNLXvieeI+KmXWghu4LcHt9Hi/bZqopye9I32F52VJK9lqWd/nZDFZvHzH3azvl2+AtRzUo2BAWjRoGYd6e9GKfhQ+eHstbP6ey/+FYzmmq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEKOKaLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNGPm3Ui; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEKOKaLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNGPm3Ui"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72lTR3295180
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=; b=kEKOKaLc7JHXads1
	LiyvnEtYHpnm7QbgsRkuvvdn5iKUn31iiuV9BJoaGZr29co3jC6kI6pStMAiBmcR
	6jgwwFDiUIfP3Xz6UPHNmYvTvu77fvc0/3f2yPaPzuL1lSCpUaV90AououKvT30O
	G+3/JVwcwdGxb7zOb0GFIYmrQ91hdZ+HEuf27XuNJ31Kv3ueDWu+r1bdnSFlSjFW
	8WQX0dIhJTah6TVeJXH/KuQByFuvwfFBRwAECylOs36ZaEM3MWnqreVobcxJz6S4
	PMqMGMbj9ECQGPJ46f0leb96RmQAeSBh5pcCD6wQHyOSf5y4lr7Wt3oc4AH0X/nU
	BpxW+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8k35t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:34:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2d5e61f6so26221401cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774265670; x=1774870470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=iNGPm3Ui3q8cv2c8pN4PsRitCru8ZnUeCmFvn9lGNM30SBVKVuNzX+IllZ7Ugc+tpb
         Rgjyit9zP6A4Ue+7lwh1MfSUtO9uHOGtCq895bYKsWmbvV6ZU9R+r1UrcC/LYX5/HDiv
         L7Zh8sqHOVaRI5zcCAyjV6S2Q/AHKAJfJGbutsOBB/KNVlUEFrKpvigNsPP/GdHSSWzg
         ANlJMGzklO1ghvlZ+dbfo2namAWQjVB18Hi2fjHYcCQVNxVwNO92ET0APE0P8KM0HpDZ
         K5+WYKpM7KKrbUcsXNhXcWbIadNURBdQYCYQQCqFkUryIDkbgCwTYv2aBZj9SgMpQdHT
         af9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774265670; x=1774870470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP7BePyV8V69Gp0dwYW6aB+HYb7u/dPAwd2KQHqi9jo=;
        b=iVP7F1nkZvL/57G8Q+gu0Kxc0EgksUZc3Kz1g4WGT8R3JhhUZEv583JuesTrrl6X3q
         ElnZeZgh0brzXavtwebsCl84tSRo/iZrX6E75WB47V6mOnUha7MduR1P3uy4ZaGa21W4
         8NEWEDDOYN3vaZ8HoQ3zwLwGZLk6CAVCFgv2H1jKchOYyZu3Xj5mJpjjJJ74CHE91lc+
         4BTiJugWf94C+nyo8c17iylsDg8rlyuxIjgNJ/0HDaEuvrhgIgOuJ6Bn8Laf3fHEflpP
         PRWNsaUiMWlyiZRgwYfbLLzn58PZccVOdBynw9wF52OmGzIZllYVQRkm8ZaU7qae2IPE
         7jpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJATW09ZSXI4qP0/ATMcEA60QuJSTUC12v1XFDt7S9GHmYcX/LSOUeCoVC39iqCWZPhiy0f6WRll9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Qj8pFbe8Md8o29biOSs4jVf8flWE6hgKzfRhZNjYL+iAPlJ5
	bNHcyI0dxDNOYv9IqV+1QYW85jtRLLQenvPyMPLZ0LN5ONJ/0PZ6G815Mh2WkbXPLWU6hC7IfPF
	/nmivBWLphgaKtGzHkkh5H09zAOJlPbttLl2kno5sp8T3vI115oe3mjNMd4Le0t4Y
X-Gm-Gg: ATEYQzygxYCBjMdZMilo32faYRUyPnDGs7PLHsgSEqg7t4mLSUz+2XUMJt49DkUInRu
	pGKIjGIvE1HHBNJXjr9TmwuQdM3x9V1mPkWVnljRA8gsaQA9uSJ6iKYO3vi/JAeAcoicMo6ojBF
	qE6i+waiavnogtXIDbVpqeD6PmomAVrhXJQ0sfgPPwarVeO2ggvCouM4nfCDNr23KI+7RiKPX9d
	fxpdtc19uHqB+CYa6YH9J7cpVJeaSzN8wKt/4OsYv23ngJn+uexCfxm+ba5GWBbQOIVXK46Vi6a
	LVzb5fYT1wtm2PHFbxH1XIxqsHEinm54WPN7Hb/PyJ6efOiJ63MI6/j7ykHD6vHitPio7KHeGJk
	JZx+zgME+3jLXEZ0wqPOh3Ypz68ZhWaA1z8Qpkz/WIz7tzjMbvir9JUNYShXKpfQpOUNUlW15wB
	PJkaU=
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45722051cf.9.1774265665432;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
X-Received: by 2002:a05:622a:65c7:b0:50b:51eb:c355 with SMTP id d75a77b69052e-50b51ebc824mr45721831cf.9.1774265665045;
        Mon, 23 Mar 2026 04:34:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a166sm489893366b.42.2026.03.23.04.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 04:34:24 -0700 (PDT)
Message-ID: <b743b408-0b24-4660-9879-3536d8006d7b@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:34:21 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH QUESTION 0/2] NFC support in Linux (and support for
 Qualcomm SDM845 devices)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OSBTYWx0ZWRfX64VcMg2ZelMY
 49F7/Xs4RDb0Ul2oBIa1equ4oO8vXhRcHTZMjlwPKoF3TiMmZEtaI2CFxs5QFmByM/EnoljnUL6
 9w8pTmSxOO2pvwrU0sM8kOMOIhxgRfgAYlc9WzuFRKNOsnmdLKH66j4mR3+T1K1PGY0Ax4YTwWv
 1mRHiynGysRErTvxVFPncqR+1dMuCwiSxHhgryx2RGGmXp/dtP4sq6zjkc55MewJUDblYJWjuPU
 07SyvYyf29NVHbWj69XvinYsBgdjlNni53zoFEahdUoR7dTq9361m94pmgFQ5udnfomedWJ7eav
 l1jzGjpim1C4KhHIo4cSNidtDBHwWPt7Q85i3nn4yvxsOZxEX1vO3KhKD8kti6Kw4G7/G6Gc9Eo
 WzBDWObbOigLK+zOE2mw/LBxtrcXr5hCqPiNP4JugdHH2BNVshXabVzKkX0ywg/2POB14nVSpwq
 XxPgSu6awNLPRu1DO+g==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c12547 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=XBYjAflyaPWs-M9QSm8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: KHtrzsudRQDkcV6HPzSCXweGGUCz4Joc
X-Proofpoint-GUID: KHtrzsudRQDkcV6HPzSCXweGGUCz4Joc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230089

On 3/22/26 3:24 PM, David Heidelberg via B4 Relay wrote:
> There isn't upstream driver.
> 
> I'm openining this as a starter. We need a NFC drivers I assume. I tried
> quick check, but both of NFC drivers register
> 
> nfc: nfc_init: NFC Core ver 0.1
> NET: Registered PF_NFC protocol family
> 
> but efficiently does nothing. In the See section, there are some ways
> how to make NFC work, but rely on patched vendor libs, missing updates
> etc.
> 
> 1. What hardware is present on Snapdragon 845, is there some
>    documentation? It seems that both sdm845 devices has almost identical
>    setup, thus it's NFC solution integrated? @Qualcomm

As far as I'm able to tell, they're clearly external ICs

Konrad
