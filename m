Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38DB3AC0C9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780320647; cv=none; b=qoCWmu95N+4tYBqxZKesikcPZzvi7zlUmk/XBwkco0UfxSYm4uvWYN0kvfByrWazc/NgH6dK4hxS67Gyn7Nut5Zek2MsKEFLtkWJxdYdtJezYACJF3+FCN1OONmjRS7faRe1nQf019kXL6JF/p//5HMnqwqMrZJnKx45gGVPfgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780320647; c=relaxed/simple;
	bh=UDmJ1k1aLBInIvFNqEcNOlLzi9eOR2sEjPHpu1oXk5o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=BR13W44Z4NZpA4Xoe6n6gQ2tJURzsZ2HPZzkvzQH1cVFqA6Gba7xDATnY+hAI07E1OB+OgblM9yocoPs9gp96ZXBPuXsRPi68FJUChgxqpxpbVESiBayE/s5etUWzZeBpehdpSOI4VZX4jpcJKzdDsAs/w5QT/AM/dXQh60R31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMm++gvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsFy+Mm4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMm++gvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsFy+Mm4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518dQ6x3563551
	for <devicetree@vger.kernel.org>; Mon, 1 Jun 2026 13:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=; b=SMm++gvsFKSE5wBA
	g5VS7Jqcx7dcNO2P86vhYJWGVcerVWx0P9ivsVJ/5bPFjCoumIJr0oItSxwxL+Co
	MliHmyCSqwUR1fNrtr6SMp1xY07Xy3ydfng1lpyPXatpimcb7npllGgqe7pQ4aKt
	7h7cwcYwO5gbtd3kLiHku4DB5teQvOdbC8bsG0kEkAYzy/TyHZwXV8Vy2Yj+u3YR
	f3IiuxovmzbWED14m3FJkiUEiKMRcWCID7ajSWFnS/xr+zTZQ0C7ONhgPE+2Of68
	GrGxcFcnBZDVFMsN43OPuf0LQT3/5ffZWftqpJ7hayxl40W0qA4NOM7hFPdjLvFt
	oRJ51A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6rxs66p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 13:30:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso2795623a91.2
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780320644; x=1780925444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=HsFy+Mm44ZAq0oNss7hhu1OdXGRuMdHe9/5cvtqCPVu3xyr0rnHmzzn6I4TPDuCOr9
         TYwLw+Kwo3Ca7803uHkO8NCZK+h8lryw3DHgrzaEyNXkOx7in/C4NtOUdF9vacn9S3zF
         haXloshw2mvoHYLKm5LCIW7V34s1E2WMjaATTO0mPo/G9yEX50PKVE/BS+TU/kq4VGuD
         s46PPQcubWq8wcZeUYccxCr4QXYx2hKNQJ16IKyyJvqX2z0lSEEwufMCSAz5NvyyumNb
         rivFfRNdTYBuB9sv9AlyaDtmuPNWGCIBWCFIrwraxHa2lf8zjsPR0qlwixYZHaXvFU3z
         Dpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780320644; x=1780925444;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhd58qYV5qQ5sfvU/qA2szyY/a3HbSOfNKYbjuYIxdU=;
        b=Kz7A7cdqLIgd6U6zbwq2DGr8/LzPy+yx2u3QWQMuYGe2pj15UoHMo6HWDIhkMUUuWu
         qf8aPUJERlB503CSJ2g0+V8ue2PVeEwcdPA4MdbuMM+JIhGkKq3xYHdkFlg1NyDdhYqA
         Tjh1hmUVPAGbbPx9JiqwXAnn4TDt1V7j6gJM1/SUj1Oiv6jCeEzRdMvaCJiKrhKSilcC
         ItUwDfNS0Dt+dS0GmHwu2+ezMvXIG4CftzBwEnEIXonhZ23tOpBeHuUOybeRwi9a4BAX
         Jr9xCyGaHh0xbU9u/MQ9fT61T56Ejz83Twi1aeADnJm1LAdWTxkSo71fk3q6r5JsonVZ
         JmnA==
X-Forwarded-Encrypted: i=1; AFNElJ/BzoigBuQ+5CkjKq+tLxMuJ2GoWfIwXfMxPMDbo2ZjAH+Xyv0qchDr0dBq0JLoCnKQoQ3XjR339psC@vger.kernel.org
X-Gm-Message-State: AOJu0YyD4z7JbpHCgghE408gluiIcXc1nyE3f0jlPcov12MyRIHbMLCY
	MLaaTUwEcdotD7GSGw0obraC2LXH734VH3dxCLbOhPiCiCKnuyFpcJ1yI8WEpLfnDPf9pCFXiMq
	AAPhwWZa3l6F+uZNjNuu4xh7kE6BZCQ3b32C1VDNQ2oL4PnkXOko3aQxJG28XkjwZ
X-Gm-Gg: Acq92OFTvtqzAmRSWUq4JnbPBC215Pln4WSxOjBsahN+hXUbhyxC75jumnyhzC7vZi4
	i+sDbOw74Jm6RfBwkJNjVnjEpSq9jKaNN9u1r3HcbCCncrtcL2DgoSiqr/406wvWEUsjm82NdbX
	yQj/wazMSe3aIbCST2zo/GBCuFvXazUAmx/nEWE2JfWSvKj1rJkW5e0+F7kIRAf90wnjtHtd5fN
	+NN0Z9zQRWmdVqflBusJeArTghkdH+cmRj9x3rtm5GQKyN0qSeRUg8mIDkDYMehwVrE9MlW5rh7
	iBgr4uuPWLgeWGo/kcIDWSRPt1j9hJnk/035AorydQW+5tupgLKlJAeF49fRO5d0BnWw8rvDzby
	RdM7alptXXULnaEtx2NMB7iZBES5RKmfIjC2ZxAdLHqcimdhuEDAOZXM3evZhmg==
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123080475ad.29.1780320642769;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
X-Received: by 2002:a17:902:d58d:b0:2bf:2e28:db28 with SMTP id d9443c01a7336-2bf368263d0mr123079815ad.29.1780320642277;
        Mon, 01 Jun 2026 06:30:42 -0700 (PDT)
Received: from [10.206.103.106] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e6ff5sm143718315ad.7.2026.06.01.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 06:30:41 -0700 (PDT)
Message-ID: <c1d1a8db-9cd2-462c-ab6b-d14eb97c644c@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 19:00:33 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
 <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Language: en-US
In-Reply-To: <178000641103.4557.14582699057810501776.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: S0T39GcxDFBVaLBJFmt9ET9nIxJVikGk
X-Authority-Analysis: v=2.4 cv=dsfrzVg4 c=1 sm=1 tr=0 ts=6a1d8984 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=FPLoCuxg6rETm2Q1RYYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEzNCBTYWx0ZWRfX+NEmuDJwZLZZ
 ms4Dr15UQ89sqnBKBtJtJQLkYX3miIZXuge3Zvq75J/5PwSuqbCJqy6lFf8kAlutgDfxdYqpAv+
 IC7wBDxfKzwpXRefTnJlccnpIPytI4AGL51V3gaA7ROXSOfQV8Vebh/01/tT/37gSxOFfcHGDr9
 NasZrpPLr5+mNU9R4qLv4fwPUYGewfr1rdT7ZFuAB1RYRKZJLIG0UEnjq7G4L2fnIYWXrL4xXiW
 voFW+zcE0Tpx0JJsbf/Dd4hSDVqFdQQ2qp7iXNjCP6yCkVa3QTFA/RVMfrIG1geaKt88Cqr4e48
 VAqTnMaaKDiI//nlyMKqlV3MendwPPWq7mhsKF/Gr2ie/mRgcfDi5kqvlMxRRooJob7QgfOI+b8
 c8zv+7SDvhXKfRW4YhluUN1UhJmYS2gmd8hG/39rbmdkniRDbZs4V0xs0yfXlA53ASi+NptaAds
 lIU6E4NNRULFLT9z1rA==
X-Proofpoint-ORIG-GUID: S0T39GcxDFBVaLBJFmt9ET9nIxJVikGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010134



On 29-05-2026 03:43, bod@kernel.org wrote:
> NAK - what is the point of this identifier ? It literally just adds a new
> define and a new string.
> 
> Unless there is an actual difference with 2290 which thus far we haven't
> see, this new type is not required.
Understood.

As mentioned by Vikram, Shikra will use a new compatible string with 
fallback to qcm2290, similar to CCI approach. 
The CAMSS_2390 identifier and the driver changes will be dropped in v2.

--
Regards,
Nihal Kumar Gupta
