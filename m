Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357171;
	b=xBLcGLaZDrxFqaSHiZhPYpgmyGu5k0VKYS/ks1avwbJ4nZiNrU6fhsf7uVqxYuH/GrXJ
	 bh+vc/69nPiQo7vUwD3BRKa5f3uhUPQ9bLOn/DM/WZru/FDJ3twk16A+CfXm5J71DneSN
	 nTl1595l0tn+mMjUjcjA3Q57W7lB1UBcMavD9KRVPZKqfBCvRaUM1BkEtjL711i+RpUS3
	 agvTk4PJSbZoTVxrVYTWDiCib7ON3GaVDdP/YbCNzBlGOoWctLixByUt978mRNo2MmtUq
	 02boNc1SNcYIIH6vm7bxCDfnza0jlbSDTt2zoLukxwvUniU+TbJmNmc58t0gQPdvkSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
	b=KQqOXEYWhJpddZ9t4cJ+Qrwu2YITRUKqDdqVEHU7NXdJvvDNmqgU6C5pkjpq57Jwa/Ta
	 Z2F83k0q4l/iEJ4kss7Va6GvYPpMdtQRbrAMqQupg+mqja5avS6nBxq9f4cAUNVUWbhsF
	 7cnqi24R8p4gfLwyl8XR3s7WEh4h7i0HSvRVQcXnl/WH0fRR468o5pD8jVxvjfhGKKbvy
	 fQDqA0hF98k8E5FIksYRDzpG2CrNsnOvLIz28/h71ovG7WId7yo4nGa41xcjjbyKyeSia
	 mVHlUmuiSUwusz+UGfJYl0+Sb/tpkctPVqrDFpKg6U6uzHHQdkUyrGsrPlcONCVfWLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibicFfX4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OldLJ+Rc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5C6606A32F
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA5C6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibicFfX4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OldLJ+Rc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FIlH1762227
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=; b=ibicFfX4oEG8TjYG
	FSARa6Uu6yiEbMu0aFmHkz5iyz9gZid3fKr5kB8oWlT8qJ9IF/Gew85Dw+xZFv6U
	prdI/tj+TaIheB/c2bNZh/0LCvpEShGYAAsmH5JugamM5qxmtCm+MF64bmCcZ2aq
	46RZ6NY7SP3l4XtcldwfHjjO8WEB/v1o3lgf5vzbN+LWCB4p37eG4+TTeBqzelIK
	HRpQOGgMq9mcGYZRVnEO9gZovuLWz1Hg5zTa3DaZdx4NovuiF104VWaXVILGaVGL
	hlOQDFDn/brLOZiGQcslvIhufCib9yY3EDf+dydAUfCihSng0SAwyEh7GNCArbGD
	iCeZlw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pagtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:46:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cc50fb0d2so15391885a.0
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357169; x=1793961969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
        b=OldLJ+RcRcBoSkUFy/rIkbPJ16oFQv3byhloXIdVZLvaaMlcQMWaeFm8dJ2Vzg71e8
         oFlrsqwfdC+XPr1FA5Dr/jNZztfFOE8eLrIwkgdFPTpNGOpFldvYdIU68CHKcLSFH9Qa
         iO9Xj0USTnnPIhzs9YhT+Y4J3wm2M9MDVSTjCRd4HtRpEjo/2rET1uHVKl9PhL+5pTrc
         4/9C6i8cY7sKGsKYu6cmJSrCliLkzmAZHiv/PCw9ng6l4Q7arsvWyvd+WGoN8TkzC6ji
         32RMtcOgIG7xespngBuzPQXKvw9fsW8SzUuOR0n2x2bM7opbkd86Uci+575cMNoHsNyp
         ZACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357169; x=1793961969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
        b=j11CIKw3W9vkugulb8IfhBGU4c963bnetNvRaFwzY6t4rsPDQ+gARjkvQGLo1sZ7gC
         o3WdR12nye67djfcwIF4Odrjk9dttNeeEJYOSPNokSL2aOqv+Ce3iHMxD5/PSlDtvvzq
         F2imBWXVSFCcWrkvf5uCQtH8CuwD0jZakU2PFiKuYwIVyQTmEE3le9/OEXS8V2PSBYud
         MszZI4QlGVolBxnBszGrW5wYwxxlymIP2UFWmxrh70fZTaDVV2OzG0YAbjnBARAQJfyW
         YwgsqphusWzlgKt+DmsbpkTOR5cKFcElxLGG2b5zISNlcgXoEp5Bc8Sm8bStJu2Bfz1j
         Dm6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy99Jp2V2pyO1YbnK+vsH9Zw6qCj/mtlUTiTh4SMmD+cNvt+94CqHsOHBAGzVkWG5Sy1W8Fjxa788dq@vger.kernel.org
X-Gm-Message-State: AFq9FYLIRL73chn1l+BRAJHh8ULzTlvJU22jHmhjYIAXPZyI8K2IwW9Q
	BCq8zBl3w3iG024uL+ybejsfiMg/hiB5ZluAMKZYHBvJLmS+XcC/d8CXY5cyMtrUPiwMyzwQtfb
	3bDc2QmmlMT19P64hHOZwaYUBHH2fX987zH/4aDCC9feCsvkVVMVDP1lBJn+2rSUy
X-Gm-Gg: AYBFou3cbn/W5QJTaEMODsiMo22UN3+VZpoA5GjzK2xUVQIaH9Mo3b97tc91cYjDvPu
	brmyq0eoo1DQQLndxqtEJi0WtWEVwbUDHz5tSIhlntRtvyvJR1KZKBG0A8gQo6JncgdNpyKN6Td
	zRTck+dYmAK86iW4l8pZvA8cDwaXjMQ0kt3us/b1K09TxrYcoZZTvZxvoEcLXQEcWJPyoW3x/Lm
	ZU6sKV66X62LE3HmOL84rG69MzuY00FN2zWHrtaXbUdDK3gnhNOWt8EIrg01ko5+WUhf6UDeR7S
	Rs7T6mBaT7qhsw+1UGYo83UuSASJhfD3S6XDO0gLBkjo6HLZYYZNb425b2my1V/9zy0rxB29++J
	x/R5CPQgExF8zFD+uY/83rjvulK6MEJxqicaLIIRgpukXXJm4mjAgZ/EwTW5PC8e4mGDFsg8=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr297286785a.4.1793357168956;
        Fri, 30 Oct 2026 03:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr297284285a.4.1793357168525;
        Fri, 30 Oct 2026 03:46:08 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cab9dc577sm52613366b.0.2026.10.30.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:46:07 -0700 (PDT)
Message-ID: <3e798ac9-e0f8-46d2-bc8d-e0fff9c07fd0@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:46:06 +0100
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
Subject: Re: [PATCH v1 0/3] Commonize Glymur regulator settings for fixed
 rails
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, konradybcio@kernel.org
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gopikrishna.garmidi@oss.qualcomm.com, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX71xrDSMQNBos
 LHfDJZ5v+a++juAi7wvIqVwwShTYdAXq65FReoWWL4jK7WcBhX+kGsfWgbl+o4RncLUg2aCfLWw
 pFm1K/Ws7DjyxuZ9mpm6MuECTJ7r2Zv2gnirV8oqhfcci5Mg3hbOv8GqIDNJysfHzt2E/b62J0J
 JHEAMzqLa3ZIGXnrvThxfIxAlWZ5fWienRJInedxhQbp/989BlbYVp1VlljzLZsMx3E5T0bGZUn
 s6OFYXxsaOZA5szxmb393H4wNUBgA6u0jk4sA53t9QWI93idVhexU0E7y+ZXMlpJUpTtPpKa7BD
 aDhhO8NBRwNZUGiDXvsYi3VH53U7G6+XBMn9xV65J8AyACfu6xdtXU2F1OPHe5BzfdbNcTZqrsk
 hSfDSHnlqI5xYIp1fWgKUD+pe4EF2fyImFwxbOiXzdokk1yIXkS0Kx2t876ZpQJmBxgvrcp7AZz
 +c8Rln/wInY75KJUlsA==
X-Proofpoint-GUID: LGr5yJlAmNaCybpdtSu8qZE63nDrfkpr
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae47571 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P9L5n2JjKQnZrfjJffYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: LGr5yJlAmNaCybpdtSu8qZE63nDrfkpr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfXzVHORln7gxBh
 sl0z4InxbRPWQfRrXadLkMueSPcAazvZYP6zhjsp45w4qHrJxkPeTdHHj2uk3Vqf3NQ4faLSmWV
 2InUzo6KiDqzOkZ02+y0b/UHNgmqDzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300042

On 10/29/26 10:39 AM, Sivansh Gupta wrote:
> Hey Konrad,
>> Certain rails are predefined and will ALWAYS have to be the same for a
>> given PMIC configuration (due to electrical and other requirements).
>> Factor these out to remove a layer of pain when creating DTs and let
>> one have a better way to reason about the settings across the platform.
>>
>> Glymur-SiP will be the next target after/if this is accepted
> 
> This series conflicts with mine.
> I attempted to rebase your series on top of mine, but it didnt apply
> cleanly, hence wasnt able to boot test it.
> 
> Link: https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/

I'll rebase the v2 on top.

Konrad
