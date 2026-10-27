Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098757;
	b=Fn6ZmC1t1wywkmj3jDDJJpQpehFL3KUT4UcBBfkuTV09WHuPDfcSZs5mQ+mCzBGltV2n
	 hLpLJ7HIGGfT7e1E2G/+zUU3AaXR3iH3lFIUtZy5W6iqmLKVT2yEZ/xSf41afjfJPwHdQ
	 ouOaDF88bo5XwCaMJRJwbn8BNmEv5haJKKKJ54IjE5s/4C0YiWnpQp/mcJ2iId3Tf8XNU
	 euldycws9yE6gW9E7Lbp2Wumi5nH9jqidEnM2v67Ck32T+zVYuWlumQxU3/57PwljSfg2
	 86gdGb06I4WKH5Pmbv8ISOZC1mlOUDRMcRIgxQ1buap3Fvut8OfeSL+X2LpWEf0BBvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
	b=g69zPL+JJiXgXrVDoiyO1y2QFi3KSh+9EL1Vq44gqQPYVgWzfYug8XL4YynjqVOjXeK/
	 dqLg8u9onI2/MTN53f8AXv3PZL275j0n3NlMdt9ci7s8/onYct/h5CMQwNewEM+WKsFXW
	 UA2A0IITaCAMsFB8ZCpCnEQCezF/NwVJSqKA9B9RUXbzOIT5osngVIpb9aHpQtodgC9ms
	 cUg2LhwdapZ2tfEn9DVxTF171y9iY6yOTSXwiZQUGH/er5xI20gOhqhiXcXJoZpfyLUn5
	 RBT1KMd8frsIgvWqY30oeyp7WyYmeYHoyp14KcZf6uR1/yo38p/JaBvwkY2Dv6YpMVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124AA606A31D
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 124AA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g2NsaQRe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RWOcz0YC
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe4Ov432508
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=; b=g2NsaQReJ36rM/Hw
	ANtKXnFgPvPjpLlr1QmogjS42TTmdSuN5EMeyL4OMzU1NqjBitT0xlH1SYJUO8gs
	rY/P+vC15kNgOHSXXkigaUL+sWgqFwFtNLoG+KzKeal1HYp9Ar7kR+xksi9atzNN
	2krbgZUxVuLT8z9RZ4kv/FzEb1kL9QoTvu8DciIqEvVZB6Is8zLJkODgwn7lxNj9
	ei50p2n9LxI+s3TE3IstWDSg3lTBBuh3K/G/yaHUDJxw0FCganS8N+c/HWno3nE3
	amgBCr5HTRqhEiDmjMAIzIytndhN5fF50tWADHyiC6Og5O5yaPSPosAIaOAfvoEG
	qOhSOg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54ke4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 10:59:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so119559485a.1
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793098755; x=1793703555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=RWOcz0YCAQ5klaOesGNOW8t3k/YC98NFY4jWZ1cQ8PA9um8fx3MhAVSv6T6Q9WjEV4
         r4QX59QSBJs0jcGEe/8iCJQPDyAFNDN8s3P4c2w+Wg0UHCSGtqUfRdcaSFMa9wfxNEZ5
         AOHFZ2lMd9uOwvGfg2+cyvdSufnogMYAk/LW2lkV7JmImW4cn6yj3cSIA4jAm/8sjI7O
         lwM5T0rqrENnjZl18E4RgEEmf4U9T/IRwk6YSruS0Qjx5BbI2A0MuZXpcH/9d3GJyIoH
         0XOTDxJE600/sW8WX7D39pBu7eqRsiqZb4Pd0N+LSRpinH7S5HHHS274uuNZb/6E1pEA
         Prjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098755; x=1793703555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9sribCAPn1TvRcyAr4unCppr0dTL3yEaXFx3Qc1128=;
        b=PZ78vfwGn1KyzF+fs8LYi0E/73lcVxLWzH14xCfvS+//av+veRXO4naZrrWA40PT9k
         JgdgBGqfadrcikUSAfVql7Yt6m8cEUHmBv5GxNEHX3t7vV/OlNMqQqCCLruNiogRusuA
         HfyE7xlE2mbrhA79ob94wek/64qSD88SeGJelX93IcDwVzbvx0jvXrZ9MHC9ZLMgHpJf
         3QNeriDga8hkhFV9LWtKV6dOZ6RCWtjc2ujxq4DVrNWNRfVZ6TmvMB6VpRcmGntL8g+c
         m2BKEBrluAd95h1H0RDrbLb/cI+tKF5qXGM+y35skbd6DjscMMJShxBpUzRNyQycduzt
         +exA==
X-Forwarded-Encrypted: i=1; AKwUvBzaoue4yLBd45Xu1do793jSFOqcNhRAZ5sRmrIEMHTAile5fu4ZbaCZM9P3f/LEfmdP/ah/2wDfX3S7@vger.kernel.org
X-Gm-Message-State: AFq9FYKoEmbk6zdhx+Gh5fiWhrzfBVwp2wTvI8dtT/exne2ta9JdaJ2P
	ZIyZy6grqf2b3QQn/lUGagMXYLNY4WzADTPdD3uMIQ1Mxaf2n3uVWCZJyQnPpWljUi2V4xPfUYM
	kwGPWdAWzntqebbnHmNWR6GAho8a0JvvaEqixSOvnwl5z//coteI5Kp7eKkNS8Td3
X-Gm-Gg: AYBFou01AReVDnaWFohgKl0NcL/DeFymRZpm3Rs+0Rx/hApgEBomOLoe57hpdEMgP+b
	FAeFP01YWlDNwK7Fw9iKAWBSbFOh9SeU98n4Bxtt2/79ORnGCB19DFmw8YcXyqAbIgRf99ViCRf
	K+oF0menrPXuFmFMeKOsIN//hLgFr1oVeVAH0QTAlIes5GeKghLwndVbvfBSg665sy1gzM0+fTm
	yMf/L3sF64k8sJEtwPE0yqI/Q+Vf4STv+cWS94P7p296fCqFLQb9SxmB1s43dyfp3BAiz9co8Us
	lL1qA2PmdXOYqXPS/4mlUqVUl846q6cXF7/H50wLg5teTRXQvWGQb/ps9FwIqzckiFbgoVfhjWv
	IOr440zbPwWGRcnCeu7Fk7A==
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731206185a.4.1793098755374;
        Tue, 27 Oct 2026 03:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1731203185a.4.1793098754937;
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7bbdc6sm431186966b.87.2026.10.27.03.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:59:14 -0700 (PDT)
Message-ID: <3351a7c6-6dee-403d-a8be-57714397144c@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 11:59:11 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: gcc-ipq8074: Align CMN PLL inputs with
 binding
To: Robert Marko <robimarko@gmail.com>, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, ansuelsmth@gmail.com, john@phrozen.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026120920.1667982-1-robimarko@gmail.com>
 <20261026120920.1667982-3-robimarko@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026120920.1667982-3-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfX1qkWEQAW58vX
 XNI9dVUsdUwWXFmks7+MuqDwKXExgpWBG2d51rNEgJaHMQf2VfgkRd7wPuIMKf0POz+JWhMPQEZ
 qUtF+cfjMbQvCrJVtLyAauqLXC+Rjt0=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08404 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oPNFLItuUPTHsqlAT3AA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: m2cqHYndJu8rruzcnkNTrY3Eg7XJjv2k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXxfVo658RCcis
 C+quT6xpm5tgzQUb+4/TLfslVsvNucCvqWGrrj5EmkZlM5KXaThU2UaFymjOBmQFaF53N8o5A63
 7ADshRDTEWeEWKD/j0CkNotNbeoNN6datC+zMvLnLBMtyiyyOFDznpOrU5f9zpEn5BWpbO2ZbPL
 0CjAc/X+fj4a80lkMcaLJLxPZWog3i6cuUJ0+Ja473/MBX41p6ADBpUkBorAVJjIpocxH/EKchc
 n2WW4kEyabZnTGpMKljSmWs75Kwdqn35mNJgS2YRnKcDqVyEyoAXP19GYO1xQIJFN+xDIeTawqI
 fpX+VEoBLuksAFeVuvOvJEIp7SraWFygBplHACCbPGblZdj5ytIsXss9xwSYOfxo5O5Z2Qoph3M
 qbtsy54w9gg7+A71q1l55c30UbjvBBA9gIJv8Wk/HVFq5rKpw/prlgELK6YJD7UJIYZUupXYwUx
 ozkscsmia5oYGPbvt9Q==
X-Proofpoint-GUID: m2cqHYndJu8rruzcnkNTrY3Eg7XJjv2k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 10/26/26 1:08 PM, Robert Marko wrote:
> The GCC binding names the CMN PLL inputs bias_pll_cc and
> bias_pll_nss_noc. Use those names as fw_name so GCC resolves the
> clocks through DT references.
> 
> Keep the existing .name values as fallbacks for older device trees
> without these optional inputs.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
