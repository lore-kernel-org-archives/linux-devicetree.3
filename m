Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497747;
	b=kjW/tAZrndeyp/+ViH1KDB7vm718j4+YqfzbpHR50mnQZbviYAN3ekzMBFQqqFX7ut3d
	 pAcuGWWri0x/dgqUWNuznaKBgNDEv95AQKpwRvcxlJbkN/aH1yW3IwS0dnnydYgc+23Ou
	 k5hRF7YqWTCqhTwX3JFBxEJbdAOUGm49mTFive5N/QhrEdVslZl7mn0igteZGeMPZCotP
	 Zy420Y39x4h0pshb1rZ0LHzS/G59QIOMR7mCKDIjlk1bx+/X+6EvsapeZKGFxMugfa+3g
	 SSe1AWkMTDTQy3ckkE5IUVjSZOr2kzi05qocGI7zPbXacjZRjyc7U7d4pwQRBu1M72w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497747;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
	b=SqSALmhYhnwD/vpgdVdOJM2DYOv2s1lFrefsHtoQ7NFMDm4ClnS3x9nw1xxUsGuTVAYy
	 korGHk4LZbWTIKmDeRwHmUCnmYc+Ub006rBbBqCudaJElB33P3Az5ocWd+Ip0rHAKfx3F
	 PViZb/VuN17NYMEom7pwNmDtIfd6Pt++TTCPu1V3c8a4UDt1WfBRZYOyshDMrGwo9iJyb
	 HXG0NHVokSXurIrvDSAffdKrK521n0Odg4kKXv3YXlWSahgRDfi8I5T0ixrh4yZdUc7e5
	 mydYIaRkW/NjRphHD0AbA0JPQ6QjksEJZNE9kgG01ohymLFyjsSOWrKTiWdoncNrVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CEE606A31D
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94CEE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBXjVD2089699
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:02:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=; b=hn+OfHivo5jDnFft
	FUqBSTX1uatQPnjCOrPgg8MmNrF2SZMquCrWFt4idF1IV4ZdLOVUl6r/UeTnFySz
	mJYmlbjsgevWo5wrb49ql4nWjRFSiUxTBs6fdIwSKMsfyFpR08B6S+7rcWepJffG
	TB4uM4MYJzTJiZYWGWLwXB62mk4u+KunqVWBgxNd+0HzB+rVzahjuvUxXjDPa7vR
	O15RwqEQWVVB8wvcMAXAzqMtXcxh2Z64VKlrGM4w23qHvTf6f2QFaZnHzGlmZ2Pz
	jc9oIGIgyqDZ9VVCNIWwMkpfsDyuNhv5r4RjiFZao04alAWX/zFvyXmOAQLyTsph
	lRdH3A==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjc1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 12:02:25 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc781089b9so13695137.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497745; x=1793102545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=drbxjFeTO6qX2AySQ3kPGYsp6znUPrxHjFyEcibxvB9cy/a90pvo7sePE5J8v4cYTc
         1bEE1lpartphPahpv/gSQ6TQrA1a4aKEDq1dDIGWLZV4OHK0R3Aks25U+5GUUEcELNuU
         hv78iPkJGJM+4piftJ2uYC0V3aC4tcuS5IkZ+a4m73KBtSa5VLUjTpeHVlh8OH1AaI31
         VCiHv+n44v9IQ77csaS1uKgPLAt5txdKeufaOwhxUl/Vj6TncE9PjM1gN9q9BPEaneX5
         k+Dd1zgCPnC4VKF4Z7H7/Y49UvobvT3IMVAkdsZ5x7o2II/iphFCid/7DSEjr/T42gVZ
         j+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497745; x=1793102545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=iOZrEc9S5jLAD8bLsX9csfxuy/WG6nKxteRB4XPPYiwKGetII1JM33RWwnKzJqMuwz
         NRXOb6H+emO3EG3zDC2hOUO/p0X2Tnt02TdI9+utKYUO/iM9cOUkx+zp4w+znM1fM7Rx
         pkQH3aMTslU35WmS3n3DJH1TErqKp/x9yJpBDEbfJJJDIHfRPd40TW2AqxauL/LnzjLl
         nzWXyhANLk09NhO0oWcETvcIC7IuTIOIANjtP6CTU97lNJ+oYzFOS2CvXY//7xDbQZbv
         DXqPIkPVwZRvlKdcVBp9YsBRVZK9qiMyBapBZjZazzItrpVp/n5FwlGfr75xF5OYfbub
         i/kA==
X-Forwarded-Encrypted: i=1; AKwUvBxmttsVN8nkUDnMB2OBaiamJjtP5fwaaCej3Fvr6lDaX2fYe1bnNE6zGraqursaGXWYOSS02RRJNZfC@vger.kernel.org
X-Gm-Message-State: AFq9FYLIIHGnUlfRDPT0Qe+2MUVaFqGpMQLSeiQTAaW5hkJsaCzx7Ri6
	47V1xW3mVXcHLcyH1njzaycxywebrtxbZ4712NxU6cuzBkOWk6AEWQVNnaiRXoKsOQtUtv0SFpv
	RgtYmgBIUnDNcx2oe1yg5VWuYjelToN7cMTywI3GKwNEc7dRKQFKjfbLyJZ4O2YoX
X-Gm-Gg: AYBFou3nsVlVw3skH2sJUrKeitS9B5WJAT+hT21FtPM7CbUHSaGybVAotMNJnGgF+cb
	vsMOmu/jTgpXVZC+f4lhl524Q7HVptFu0hvT3DBHfOkhmAeRfXES5GvvhHLVNcsVjTR83tZjRFu
	CA3jve59ZHwwEp3DJbj7Qhua1puZI7QZKCIRWk5U0J734qCv72//TOkfkEAhiQHdaBXG96R7+c/
	6EaWsHoDKvveWMjzg2fU5vj45+d4MJEQVSwa1Zwh+Oyq729g7mu/+u7NCdsnz/EEC0cG+LL7IV7
	jQXzQ/kMSYB4q2KzdMbuqRrL+DdhRHGwMsTaS8Np7rwyWU0F7DzMCpNYmG4eX4FLAEV+kKLCMMw
	YxXsd9nYPOgdAJYmFY2xP/A==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904238137.3.1792497744844;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904196137.3.1792497744278;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm5009277a12.20.2026.10.20.05.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:02:23 -0700 (PDT)
Message-ID: <2c58e865-27bd-48a6-903c-a4fa5c0d92b5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:02:21 +0200
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
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states into
 lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad75851 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: rlOkBQVHmrwd8E8zjQk_qyFm0vkrGXjB
X-Proofpoint-GUID: rlOkBQVHmrwd8E8zjQk_qyFm0vkrGXjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX1BiXto+wDdKf
 pfNP/D2vXBwkHSyJI6i6l/a/0mjzuUAqZ1BkqHHZbfLm0dH3uuCef40jRBXn/hDPKa9lFobk2mL
 PxH/ihd5uZWpaVgukZw4b1KGqsMSSt023zGxIHpH7nac72eJJMT1KnKZuhCqMr8Qyw6DZBBAvhC
 LWusygdrrozVpPvKnA3fDQyBnp6bl5jQnGzzje4Sv+y6j7EM9XYIGDJZEacoC1uuGAWofnLPZ5N
 dl2Zc3YlkJiXrhLn4WbfVjTuXw44ySlotZNMGRvU5y/auVnRr1xP6iwgz+muigWjKv+YtwJDyj/
 G8s7iUxzyrAOLgjDwlSCiC5CYgNM+E76fIOq/4wygDC2j3MYlFGbvVxQXq3H8QdkIRcJ9k1Zpza
 qsF0IDv9vwo0rfffAD25F7RC1+Rzl5HaURhOM1/zj2vSpcOske+SZN/4L3LEqC85W5sASGSJ3B/
 Iojtc98hDym/JmDky8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX9hOUsitTC6Sz
 HAUie53mLyMhGSwVd9oOm9b3YPVBbk3V9rmoPbm6vW40rhbfJBlHJqBgpsTtKj0xHhMFUmgao1n
 y0G/bGwUx4rBkmh/uU45hUTWWP+Alp4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
