Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575162;
	b=3yRaFu3lP/5hfJsSRK8jppKw2FuNsdy9FHEixqOB5AUrtx1CgCAtTq5loce5gLJrIik+
	 ln6hn3DU8IVbfZ/cTo3i18sAFNuxNtJRg5TPjFhhYHeE7JgpRrCGJpF93ho7iHJbI3lvb
	 YeDk6m/G+H3hhxK6oILgDl6zZtApBImEXiKv/UPEYf9AQTNX5ZFsBcaOQQ+6C0QIi5qQ5
	 nl1fH5MxlQVF8Efqj8V1ImKYVwt4xtA9ViyB9KohUNpuvvmyNB1rE1YYpqric2ewmwiyg
	 yyeuE1ru8M4ePD5Pf3joqDy6IHjdmfPIKSTLIsR+r7iFvJ/2RiJ8Jdqi5Il9owj8c9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
	b=YSU3C0uIX7gIaTUE/gfIcBX2kEb1pUz0ztEpNXTo6KIdXc4KUwt1ih+opKfGaxv14GUn
	 idR6ugZsqFYSbaV2wHtLGm55AdRbblB0FOkuTGONZmjXe5qD+vwMr/p/8m/oC9rkXeWnF
	 OLRLNVlTK2pm8l7+4/EINxaU53sDEnCSdls4/2enRmgSNUzDthAhN2vcFm9l8unF2hCtg
	 Iz2Gr/p4ij2+5U7CNnjA+pX8TvZY9hIa1sIVuLiwDO4sd373ar0aCu9yhorZdNI9y0cFU
	 JPMZRKvmKomvVcRJFT3lHRR5VaA4XWMubhMTZOmVu+Ii+UQ7gKlhLX0bkq5euk7IJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A58606A31B
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:32:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3A58606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUtPRNxx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jY3AlhAy
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7cdZq502632
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=; b=JUtPRNxxI67F6Hv3
	kk03khUGkyKsuGjWIQMaGq2/MOQBBc/V33NO6OeW38ML6V/KVU3RhV2cGXOXSYB/
	1cjnMSPhbOl1RCxQVx+O0PnvNQQNzH1oG/p72Cqnd6rrB8n5DTPknV3S9VRhHXIl
	nCFuO8YVNFXozMw5MVCjRBn1VDqLT7On1XG2BOJJ3HJ7ScphFTDZCv/FelQR/aIf
	Dh83BrZ1VhPZFrZ8iBKMu2tyY6GAuRk3XFZe3GjD4mid/xW/Vw1GlJFz4h0P+8IL
	F33bpLGLY9OScl9ZxVnQiKQrk0dY8jCijAbqMQfOpW0ZSrqOsjCQlszcVa1D6XyW
	90I1uA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk98j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:32:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536540909e5so1616021cf.2
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575160; x=1793179960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=jY3AlhAyweYyNw6+MCdXN79EwCBjjAPJd58GmV5vhpMeDtZRu0JL/rd0UmwV92Zmbw
         xOoY2TuZdXZdoiubQc4kNt7gIwVN+5SqW/oqKT0g2XHl6ENBZuerzKHrDlNndQOCLrsa
         JT+xpEq1nscQviX8oVrNnnsiDyQGVaNjgHlAn4lBjBKbH9rgN7eVLGTVO00ZpHgF9P2A
         6hRFpqRn983GnD++ydUa4QZZMK73XPwwHXxK0Aapm/3LGehubvvVPnyzvR+yDMdllsq2
         OxtyqqW2RWEEF1KO8ZXMkaO5+9VdEBFT1UtNsuR00zNMvhmjOJ0gV2lOW6TYLrwCqxa1
         BmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575160; x=1793179960;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9X58+0bipBZLCALho2G1Vm/SqiWGpfndZ6BHh2smTcE=;
        b=mExT0KIFhutmEIvjd2gf5lu6pAasHW6UQrq1SqJ5Tl2X20sWIgJYxXmBhZPaEDGdnG
         7WX41MQoR+XKHRgKPVU86glF1zgx7R1FyINv64ew0jF41P9gnio2B4XlOJ8/xrXk/tkS
         u+6yNTXVyUnL+DEtoPIaJzyp2V6vmCbB2sT1+etM2cYMOGgYhNdqjrXOU76WrklTITvI
         ROAItog+phCU9ZxJaPJlnYYmZTPqarUK9hMGrn0nsKCrykAmFe0nrsrmJK3Rhcz8Olus
         ufsOP/V+FTJ9MTrM0Btgm8v0L20M5D+X4GNw976Xfsu2lP9DAk2Q2DFtIn+JOJyc8i3r
         9ghA==
X-Forwarded-Encrypted: i=1; AKwUvBwf2fHvamU4zENPnoXGlLJCoRALdT14NISRIce5PjZCmR4zZ+TGT478YG+hkJo7w2tnYV+vg6qHCHIR@vger.kernel.org
X-Gm-Message-State: AFq9FYLG1Zd2bClKO7BDZ1Dk55viIuV9ngbHU1demHHOuTvqhK+EOx9U
	kAAYe26ohiJnfAC0fY2XUHuGpbicqy2n78IYbkI7aVw7PTfcluJxLTXsDyBypu0hPH3d4h4rwYB
	iOo73wo3LGwzkPo76DqHxbpJAztOO4S3CYw8NPP/Wl6CWNcVNMD4z7UYIhDuGotct
X-Gm-Gg: AYBFou3+1zV92/dXkvEQCu1z9hme5+R04d44sMzcmJsc9z01EvHAabNR/nXKdrBi+2U
	bU4Qek5EXjKoJWjg2RDKlphsdAHe7t7IQXLAEEV3nx47BRUf6mh3oU2BBO5CvtzMFxq7araXN4I
	hSWB8NxNzs0j1SkamjbgNejzcV5PmorO2MMLDRII3yVcNmo+SMOnJrMKcYCUWLgShYrVX/PO39n
	W1JsDJfyCMX334+1hZfSN3+9pBlJqetKMDovH2xHQXPnmnrG2xqUPWYUlSCBZWb1l8RoIVvwBmQ
	vUVFp6RsL0irUd4HqxKPExLOOb5kKRcFvAqMxizUNSRsuHMmkeUFcyF1bWhy6PFEkQKYCmtaK9G
	XJ05SQbJINFhWBTd3UY3MTw==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271531cf.0.1792575159825;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr29271151cf.0.1792575159341;
        Wed, 21 Oct 2026 02:32:39 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f7b728sm58385366b.29.2026.10.21.02.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:32:38 -0700 (PDT)
Message-ID: <124dbc57-162c-48a5-b405-73f3b560bcf0@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:32:34 +0200
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
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261016-pixel3-audio-v6-0-11c88448b3be@ixit.cz>
 <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-audio-v6-2-11c88448b3be@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX0LyqQJGS6wwR
 fhN0B0IEDVu+J53ljISF1zwsURVvHUP2QbHFlMAbZ2aSLEK8VD5nIl86rdosTDLagicQF8F7qVR
 PzTsqxqY/J1NVp3+7cX/VF/9wpV/WvLXRWPN83oAc+RGaGI5/knkcBQ4sMpzDqmdi70f80UiJH/
 ZpgjPk7Ufu0p8WH3aQGzPlwf+wJuYTJCaBzm6eTEKqMymjooM6YD9T+3b+LGbXPNEjqCw4GF4LU
 pQjdScWt5s3q7IlD7sCJxWi4VN3PuW6POB/b9qlRhoKYtm649L3TikqMYbeEQhspRGcrt3aBaNr
 zE6+Y6zWPj/T9ZH9qfZ3cQITz+ptoLfoeeJIqlSdJ+fdMLu9Lb/XaIwbWh/Bg/TjinmTUnfVGmb
 3DEUnzlFT1GzGorHJFP1a7/QW0PeR/W7jdO6DYuNY8Vwj0K0WCmXEtomSmuHvpfzY9Ct907w5z8
 GcEugL/XVxQ5HcTo9IQ==
X-Proofpoint-GUID: -PFMFy3yLSBEZUlXcylrKJwADBvZNJZk
X-Proofpoint-ORIG-GUID: -PFMFy3yLSBEZUlXcylrKJwADBvZNJZk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX98ZIbPEBM71t
 rbO/mQwhLdn1/EFP4NSsjZMxPkbqClbrYZBYkuzG3MxVKDJbkjkZmwX9TAOMDLNyF/25C3PhVCu
 bZieZpP4P3MR0ii6X5wn4cJBW+rfMjE=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad886b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=d2f5cIJWjcLx9DfYaNwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 11:52 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones
> 
> Based on work done by Casey Tunturi.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
