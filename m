Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590621;
	b=Xhwpj6okXYUMOw15/PfUeLn++rp5frw533cndoojv+e+2Vy6adr219YogWmzsKX2vTrc
	 15gwFeDhGp1NwSMq+Z68m2jHqVd8hi0A2c2I26a9wxgz6niGsEHI55/ifHdSRAb3nZjda
	 L7FupYAntIF2yEySzcE33qPTsMGrV+233yZnp5jKYkYhP/wYiackP3LzY/bO5uj/fC4Ye
	 uZCsvEE9btfkPo/Hx1VXhnK6R6/Jm7PzXmzYZ1UvIJj/VYKufTKRtiKY7SpkqYWmmEvlG
	 rsryzEQTtgO45lAhu5IvfTYShXzU8PAm03hb1LIjh0VbVl8fncwkZi5hUx1xejWseTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590621;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
	b=DD9YF81+cKvhI3+oyfrXzKXXJRNYgr7XubPf3C3qaGiHkJsYj/ua3+92mCmIcqw7zl09
	 V7D7clgwj/IvfrW549BCH9tcOaSDIgXkOp4SJ+QILWF/PH4HWudZ2YWd8iM5FjeRiUs27
	 3cm+j8IWIw6DPaQ6oIaqF6vtxtvPTtxfI9K1/SQULkfTq7xd90OuINaoNA2YzjCMgwZDX
	 9tQjuPCeM7KbmP0IONP3NohCXMySEjdpUtOJfHuc7fAL2T4E3k6BEnE1Ig8dKrh1PuN0I
	 57lf+lbJmuxsjFa5KPPHLYIdGLX0BcCkeGkqJ0noZNwJL4J6wI6HsEEOz+LZEExlFsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lobVPy3N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Atxbm7DZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0195606A330
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0195606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lobVPy3N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Atxbm7DZ
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDHPpZ4038157
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:50:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=; b=lobVPy3Ngx5CsvoG
	kvvLAzgNQODA7NlDhuCeVNGdA/ODfjAIluvFPynabxfZIazv6d5FkOvYo2Pmvj8+
	ogNFUnHXME56k+Qn/sBSAATsDZ+BPiNt8Hlmn2U3G9EQTdkLTuAwLIM3OtAFb/Ji
	U1vDjUDjJvyD7g4rj3zPReBQ46H3ywvX++fY70kk/8NQnJjhpglanZzuJC+T2RiF
	F1DmNDvyF3wmiuoogHCXtNUCn8FONOb0lpQSiP9FAD1G577NperGx2vDn9NJEW8s
	9ty2WwaBp3zwlhbZpBi/5LzG2gJ/5caSvyOCR699JOneKAnFPCN118MgsDgggEl9
	PmHykA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5884jb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 13:50:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5356c6d98cbso1853451cf.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 06:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590619; x=1793195419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
        b=Atxbm7DZP+6Wcbf61QSoxpe+E6ORzPPuGlK6h05p08slfXImEIsgL+Xhp1JdCqJVB4
         PIl8fCOos203sH7U2LWKuYCNI1bLmii/IJ/AfHuobKQEEY18mdgHPbGGP6ZckNcNdFDN
         8QxoVoGmSTCZ2jF9yThx6/Nc0x2J5QpOKDO/cYmJ8IhuW9nzjEXnQjvYj13m45aqxZZ4
         byqin0BrlcRjQtmVjjtKMQA0DrgVVUmbDDvR5dhk6NI4Zp5vQpHTyZ60BTo2q4zF5dZP
         H+XBbEVAu8nOEOfTMs4WdoZmll20Zw4Vk1bxBjwVS4CTm8yj+l6kHem1TI29OvcvJyRO
         HdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590619; x=1793195419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMEwpcLgsczYX1rrm+kjFUQ4xC9iCSgKGEevdqq2NEA=;
        b=ih4hmKGnZ13Kht6iX3drKSbXeXDLWHdS8q9SmbzHbz++W1RZRoNB8tRi7ZxF44QLQ+
         I3zWOW7AnUOJNrO3bAbxB50v8ZtxwYiuZhOH6n4GCn8Lfax2hWU1Mub0mQmb7h05++wC
         fU3l2qXaa7qwMryRsGVl+TQc90yH7V2oLLIM1XWsuRHYPIeAu0gv9s5OBiNdERxDKYVP
         ulBWiBfG9gO63eFzF1zTPVJWfIO6hy8zr9jjly5nHdCBP3W6jIHKaoWpU3eBpJaj00ph
         3W+uEatGnCDNLlJrneSA6KYYqRPkHaMFWXASJjaFZnbr5f6RHFzU3Lj8AoEo9qFu1lKp
         gbDw==
X-Forwarded-Encrypted: i=1; AKwUvBzm63MdXDhYS45UA61cEHgZUEXUE/9z5aDZqCPlnjSPedspxhIDtfo2gd8OkDRERCdApj+aSHqvSZTu@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6KQ7BDRR6v9jUzMzu4OMDDoAeXo+ghcwVIEN3+RV07Skcifju
	fUyLso3X+YW7F8j10rsoN4SAlF96JoFNgUIsRTm0ppFF2/Nd3LDBzW2R09ticVpJun020DkZMqa
	jiwM5R/vR8BNbI3jY5mVn61CxJl64Soh2WzWmP2nCJ+EVUzq78e9gXEl4ahKsyZBp
X-Gm-Gg: AYBFou2Bxg+g5bNMVN0gmdWtt2btVROOohd5GgwVXeqLVjRa3/Il8bDw0g4gsB42LQ3
	agBB+fCWY4HtE0EQYogW+rT4mSuP1f8GlorRTOER8lCerRCNB1Mk/vZv68VIvEM3Ajq+2Ift22A
	xLz7nLfHyaAsju4FG7fVIQMva91tVQz/9rqxhEaj9MOVLjbUr1O5d69L5ZYMgMoKVsQlK8PEMsw
	CGKWCk9f0HqEEbCChLNr7CCaLxI0X0blNB/P7QwR8bZan6/nZf141jdF8mqcyE+QuiB1qtQKB5n
	kq2uRskGsO2P2MaK8zD4BXb12i+2o9uwXXMzcf6Yf+kuw3WrhXYKt/rfStyESc0iU0lNkB/YiBU
	PrtE2KDEJk/FpkXIBiY+mZA==
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr40181911cf.3.1792590618799;
        Wed, 21 Oct 2026 06:50:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1a94:b0:51c:2324:666 with SMTP id d75a77b69052e-5369b7b364cmr40181361cf.3.1792590618368;
        Wed, 21 Oct 2026 06:50:18 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59e493sm4978466b.55.2026.10.21.06.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:50:17 -0700 (PDT)
Message-ID: <cd73dcbb-ced0-4967-9ddf-c6c53a8a5c47@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:50:15 +0200
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
Subject: Re: [PATCH 22/38] arm: dts: qcom: ipq8064: Break long property array
 data
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, kernel@axis.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <3eb4fba92d67e7ff3486e8dea17233369f62545d.1790892852.git.waqar.hameed@axis.com>
 <4451c072-3a11-4819-aff4-e7de100cab8b@oss.qualcomm.com>
 <pndfqy5n343.a.out@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <pndfqy5n343.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX67nDjS1t0Kp2
 2c45cIXSUgY6RaE4p2KO46wLDjXEfm3yZUtTWApwnE03di0pOYh+FfYRrgAt8STbzciJKv1+rNU
 WuFt7BGecky836g0ptb2DCRFXEEWxQ0=
X-Proofpoint-GUID: sCUjGIwl-uDTrHP5b4Kt0X44tE-e3N8s
X-Proofpoint-ORIG-GUID: sCUjGIwl-uDTrHP5b4Kt0X44tE-e3N8s
X-Authority-Analysis: v=2.4 cv=Ku7YSmWN c=1 sm=1 tr=0 ts=6ad8c31c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=3-RhneuVAAAA:8 a=dF5rLCIUvE07-0vWieQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NSBTYWx0ZWRfX8l2hDxVu6+Ty
 6eojVq/UfwdTnleM5162rOFxkOlJg69FVQ5cOzL0VVUq9xyyX43Y+vVdmt0+rxryabc4MVqRo6v
 rKFWLKPc9lG0AGSLknkJv+ETAF+DS22z7DjpOnWKSn5rlHxqrDo5Tt5arL6y1pmR6nmLgw7rJo/
 gQyYtlaA8y0b3tisnLhBcOpjXsZhd82l2D2IwJDyigmlo8MRP2TRuZi1unPZ9/1D/tV0jBwcPCi
 DqNyqr96kX0WK0czCSV4OmJLwJDu53cj7+mIYQO3eXuCQjq6hetFdSNYqK1GLkiZmDFytRtYblM
 eAfL8a3Nb/T4MhxdbTz5d678fEPI6OxFMNsOQBu/abg/oswE+oiBya6tPRC8L9hVL5Ae1UlThDZ
 A7Iu3Rn+S52TwFUglhxGa+CGLdzh/1RVs0Y0h/gL/SFpOmQtx1ZHfpQR/RAbij69Hxtyv3N6vPj
 JkZ76DsYxb7KA1F5Z/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210055

On 10/16/26 4:15 PM, Waqar Hameed wrote:
> On Mon, Oct 12, 2026 at 17:31 +0200 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
>> On 10/2/26 12:36 AM, Waqar Hameed wrote:
>>> There is an awkward line break at the last elements expression. Put all
>>> elements on a newline instead. Found/fixed with dtfmt (Devicetree Source
>>> formatter).
>>>
>>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>>> ---

[...]

> I think the above approach would format them quite nicely, for example
> 
> 		swr3: soundwire@6ab0000 {
> 			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
> 
> 			...
> 
> 			qcom,ports-sinterval = /bits/ 16 <
> 				0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f
> 			>;
> 			qcom,ports-offset1 = /bits/ 8 <
> 				0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00
> 			>;
> 			qcom,ports-offset2 = /bits/ 8 <
> 				0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff
> 			>;
> 
> 			...
> 		};
> 
> in `arch/arm64/boot/dts/qcom/kaanapali.dtsi`. What do you think?

I don't have any better idea so might as well

Konrad
