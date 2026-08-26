Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368FD3BF672
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740806; cv=none; b=KDY0NsJ02xZ0RzmHXoJWCF/Up4/QWgXt0fkJt4C5t2yX5Mt8I2vVMkIQDtMzK0sIENocnzq15bRo7vZ4sTUOF8ocvwY8vksW5G4gh9w7+91DcFf2BB9duEjjsJfPWwDO8Tj/lvNBqv2654AyGfMYZJBSNIgziZ19GH9oSym3gyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740806; c=relaxed/simple;
	bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cgGr1hsUrIsyiaoctmQLVlgrazw5IMvxZgSJTU3GcXp1zCtmRVCcNsRvwKDZO795bmskR1UERpD5JQoTB5i44F6HllPR/Wsjwyjbeevq23oLtVdUcTm165x/II3Zk7RkywX4GmS5uOuEAZbqe4iM0dcug8hkpbGmRwhlddQ2hk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgjcUfau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CJNsb5F5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgjcUfau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CJNsb5F5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGpHX972274
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=; b=AgjcUfauGbhykqVo
	kd8npc3m7cTdQBotFjibBiGKBxG/eRPBbEmyuyEhnDPo3Z1OIxT3Dv+Weg0qtVqc
	IWodV1PGrCKi2qpJ1YwufRgtYxQjLl8uoK1tbYuopwvec6RDKc0G9ErcyOI7d55L
	t+oa7QhmphANXEcOENHZ20wCkNNYC62yuQMnhrwl00lW289wMmgUeVv2Mt+FrI9z
	IylZP9o2meaaqFXl9JO9AULJZzyZ6PdhVxppbFx1P0Of+LYBfUK0+2pdjZAjY601
	KHPO4OIbhH543y1ZN32ReObSDdWO432Xbap3usFY3hxdu1Qea3rGce+AZLhkMko/
	X4U2yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghmxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:40:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283df62d68so9305791cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740803; x=1788345603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
        b=CJNsb5F5ZhbXFNlmvd0WI4BzIRy3BroXGCKGbAVM8BQba2DfFW0Iog7gbTIoJPCCA7
         t1fgn31X77LGYcTNVJdk9zCbFFwNGlZv+gPB+pIZF9MlGHZ/b1RT6+cYTinN9x+YAAvl
         GBNjLZLivB7M9UkEKAAqoOr6qT6TJLI2xke8m7T89o7ACGlfR4Tcpps2GK0Kx04vrOVU
         p9UMgsjwV/77pR118Kl7ISsDqga9pTURpp9p89hfTA+ptGz2PpAJ+MUEPSx9uJLFRWAk
         cU9sbXfXpNbTLVBu3xu7nkY3ZwFXiVocMlTmMs1du01EV93CQfVLrnImAJIFL7vpww9F
         +q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740803; x=1788345603;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXFnikvtvzq7ec/RMSfGD9l662NFtY9KVm7qhN9U0Mc=;
        b=OhuLdK1x5dpBQHhN/+RJuFMg7CFOhi1x1nQs4scxn9PTP/9ZQbZMahTgI0ovEGiHHn
         YRWxc+zhq8DU6ljQC89oMCN4w8SnUkB08+KIRqF42qW0FGkS3DELZw25ov1hpA9GeqHD
         P6yxJTqX6IrV7Ml+6rOGCUoapGIAFMHmom9z1OU55GGdHrikQMAhcUoCAxq/Acvrq9Cj
         Pu5P7pAefBBkeaqRJyJ+HAmWFJ/DCof2x6NYCv/drgHa7nElshAFX95qysQZQZrrmton
         8PTZ23G/SXPQoCK4BV8XDREnslQi3A+POAnabL5PIFXI6NIbAgJh7kz8QbnDGAxUmfPQ
         kg0g==
X-Forwarded-Encrypted: i=1; AHgh+RoWOrthtCMDVwgeTHjHxFeDVhgzi6tf2Q1+ssi5zcZWzNS0MNryoGhIGrRQgsW8YyW+rVmuC8RL8wZb@vger.kernel.org
X-Gm-Message-State: AFuF++nqIVRNei7/n6/4rrdtIGjs9ew5YN/5ZwSzYdZdwRjLTivGVVoB
	W7bGuvr4byZcbn1eaAckF4rBGR0rXvOacq51kb1H9HEaxPOGgT4cTvINfRHvoeI3zab8wtn9aI0
	4ZIVHdoaQDjkCi7Y19kYOiubfhAJUo0P8Ymx/vKPVMWbuKhPMJZWtCuruU4pgNPXETJfpZGgZ
X-Gm-Gg: AR+sD12DkAPFHcZwdbgITS0rMARUSTP1BeOThQLHcLvL+1FDdALskIVWk+YfxWOEYe8
	BPlPGOEJW2l2jOuLWS8DLyoRtVS2+XM/Gm0St58ORypld7xio/Y8e05GiXE53DSGilAhHpTO8Qs
	F0vHwdn3pTL5IBk7rlLZ3a23Rzn02ExE64AID6iCGpaN1mAq1+F92WHAbzI6lbVGKu2hmRP66v5
	yh4IIHQLqNzT4foa+Xul98n1b5w/kq4j/apP8rJ4yIuje3jbvhNh+agH4qZM0qD62f/sHdkOAhd
	VHRtyg8vZD16HMqZQuibcg+3PvcRgiD9pkiKHw/K+BAkK1du9WA3Xn7d58Bsrqt9irZCZHEvfUd
	d4A5JGUO81ug7RgQUCaAVN5eNVnU2
X-Received: by 2002:a05:622a:c8:b0:52e:2d1a:6f14 with SMTP id d75a77b69052e-52e42328885mr53724181cf.27.1787740803373;
        Wed, 26 Aug 2026 03:40:03 -0700 (PDT)
X-Received: by 2002:a05:622a:c8:b0:52e:2d1a:6f14 with SMTP id d75a77b69052e-52e42328885mr53723721cf.27.1787740802802;
        Wed, 26 Aug 2026 03:40:02 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ad70sm461839266b.38.2026.08.26.03.40.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 03:40:01 -0700 (PDT)
Message-ID: <13e248c4-d918-43da-b6cb-02402ba2293a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:39:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
 <20260826-n-dts-style-checker-continued-v5-1-fdd16ca6e771@oss.qualcomm.com>
 <20260826103032.56BD01F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260826103032.56BD01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KISDaPKQ3W7mV4spQOYYcGO-1zwpD4De
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ec284 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=9ZkQsALANqwWZhioCQMA:9 a=QEXdDO2ut3YA:10 a=arBHhYMabMMA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfXznCDbUM6V1EN
 4AOm6vD1fRy06DVwjqq2QEe4LjWoexy+EiO8mYi+fBRtzSAvZf7tTbY369HQyieCb9eMkmxGUxm
 KPrM4qntPCrZXSnXaMDkmisTFYcA4o0=
X-Proofpoint-ORIG-GUID: KISDaPKQ3W7mV4spQOYYcGO-1zwpD4De
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfX9C1FdOL9yI4K
 szmDL/tsBLbk7atc5BmAPj8guuGzrkihTRs2dEZ5D82enYGa6TdOAOGw01a33TUN4ILXMNQdq7x
 xWAl5UJZxVEJa4LBX7XTEM7aJ7UUm6q13ZeG/jujHmxHwf+fAMd+mFp5/7z8TzWww2gIVpi1J+0
 czM4tv9lgITJuGd7BfRiL1XvEzoRWKXr7Dm7upVSBowrpJ8f5ShJNOUIvcS+aLapiVsVDtuY0jd
 ambz+c2xECkMOZB3tSp0AvaZ1b9GNMRkHXcyr0LtRIujT7+n1j161mcY3mDvrt8Ed+M+oK2Jia0
 vIBXoSfafaBjsi2z/RmviCld+tfP8j5kn3kV97B+IMxl20Aj/EOs85ulOjHyi5gsH+JEuH2KWAf
 KzKLzlyWKf2uapxmo+s2CUygoRXI7VC+cW7+vcNs34UtnwLSmU3SZgOGR/8VxdwSgYYgNFkCsgj
 +T8E5NHMAGTwoNbJYcw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260088

On 26/08/2026 12:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Strict string equality check for root node overlays fails on variable whitespace.

ack

Best regards,
Krzysztof
