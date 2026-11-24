Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515802;
	b=mbvXD1PlU8XHLyE8aO6iM9flt0IQ+/m/BGr01UnOT56DLi4Z4KW1d56pW2eU7ZclLc+b
	 e4dP/CirwDUbh4oJpszFvO83g1L1QWBoRLesy+GVbw8GVdOMbOhlCCoX8LxcezLZMlZtT
	 DnVPO4QAjjkwTibJW2rs1feR02IZpsqS+DVZbSvHyFnfIAIvjvrPiZ8sKA0YXnpKvoUoH
	 tfqFGOp2lWtNQklN+fl8sirWyirDlWWAUMGgFmXZYv192zerJuOd36n80NYvqzCELhVb/
	 TbIg55cC3iyK3oKwqKPivTp+F15HLGyxGDZ10OyFrs5sIUsbuBIIZt0zJ7h/kHrL4BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
	b=NIzsI76l7L8rLqksNX7z4M0NQkGoqJZ+Jo/7yyQED0gf8oSYeAY7lwUr3zGVz3NDtXXY
	 7C1Zd+xtlLNf49qw7K6UGWyqyx4zW1/oanvnaMc9gpii2t18O+7pu/gDon0DMhK0ZraPq
	 UVhHryqWLsO7lqHX71rqyYRTGP6452ii1E1YnmbLphYNqXZti2c0g2w38CDl9Rvk2U4ek
	 /uxO/wTJb/IjFjhriasM5e0kIeZVKBTGgCtTg6gqiGPEgbv7EIvT/+J9zseq1/Yz1q4H0
	 4Gxic3L6d//vRXGRKF4UQmhBL3vTuUW/gd+xvH/sRNplznVSK49Xyz60vQWm1kiT40w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD8606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BD8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ml7LMilt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hTmsE5uN
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8e2B7646678
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2fQNmv2MnA8jx1BzEazbxTqv
	aPaImMJgZb7CaQywWkU=; b=Ml7LMiltCJncDzctmpREyOgNpLM8VWutEjLBC8XG
	F96Pf7oPqmuQzPabf3TMtiBprar+icB9tJrAXWpfYMc3qYjiEliC4sh1JsDKA1pC
	nwRue456CG/s6wzPW+sAJmpZGcxWtSO52fDYe5onUPFmtgzYNZ5H2l2beKJ+0IDw
	on40G+N9TwWD5fF6koifpC3k/RqBbR9dOmK/6OU9qG0G5ObGPpvsQ40P6SWztwE1
	21l6Oz1IyFp8vVoKntDvlIdEeEnc1hrcwDxilQBUuBvR/kgTTqXo4Z/yQFVnNM/6
	xbcWuk/di6CNxO1dCHcyDPvJub7bj2zayKEdljt2PuLduw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd26q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:23:20 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3846d5f54c1so5465846eec.1
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515799; x=1796120599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=hTmsE5uNqK+4zartCrrHvMu5pELsf/34GfdpAUJJgVeUq6eMNjBuwNnYEmAiX8UyZK
         Zu5Aj2dZoIdbxrk9D535L8RKhHt3l/4pymBxxKS45OTnHLW8zvsrvpvwvYN0jYNyJhp/
         2twa3Ed136f5yB+/kIi4hvHU5I4MiMd/9aHsLkjBAyNhvrcJCNOmirZKGLQw7mAByZxu
         uUwCWraMUfjClP2Zd5oAs51yX3cle/JA871+i/eqMIbLodpW5NE+crpmYCOIfuDUB/u7
         CVurmdXh5k1ezz41Njkj4FAtUL9WMOKk6P/3kj7gwiBPadBRhp9Jd7Otp40L5sGOXPVw
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515799; x=1796120599;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fQNmv2MnA8jx1BzEazbxTqvaPaImMJgZb7CaQywWkU=;
        b=yMSgnh16HjXRWgp5du//ZZdu4e668WnYbgPKVulRNJAwH3AX/hY8OoiW9ABbMd+JVe
         RrHCXphRhIlxHejXYkGJQOqTmAOUIVa8ncP+m8eZsZyM0931fqF7RtOpGoB5+OVMV9w4
         4D8JLJHuPK5+P2z83VtCIV7iYRjh1PzUqQXiLcYRlW9l02HdXX/ZB2usHvbYSsvmIzYJ
         N3wiLdpHEA4v/pxekvwmCyaDSguVQsss4hiPkXVctMHmFHVJACVyTE62VcjERTPR5BQs
         MqoKTO/8mvcTtTHcum7ZE5EPpWJh3DYx3sU7hUdX+LvoMfYONqBnklp7hQhPuZrRvJ2m
         0glA==
X-Forwarded-Encrypted: i=1; AL+hErHU5lbyW4GUeFZmWG3hSgkPPctGFxPekf6pxc3OmGxKBQpWhtnu2kKKEuc4awFuExqtub7lGuIWw1jU@vger.kernel.org
X-Gm-Message-State: APuU4Z9UAO8Z415wo0CMluLrWSfRLRoAtXTWX/9pylIr2KV3Ihma54GD
	ZOzUO/OUj628bzh6deGJs7ixyOsEEBih4hzUCT385IvWN48Wbcj419qmNYmogtd/ehngpvkUbl3
	iVrg5oeWX6ecUpI8Gtsi5DSW5V9MMbB/VyZ0pOouP9VPS8B+7RngMVzx/f27wbx8T+sSvjTxW
X-Gm-Gg: AZFdTZeeEoTO89wNXv9BuZ+XA9AMsPSk0yhpsnyP3l806/7sALtjpjlbW3jipwafa91
	RJ0q6aOdPIwHFtG8V1EuAVkOcWI9iNo2FXynLSvZ3pl5prRbEjplhbcNXewUk5i/P/l1IVusHaz
	APinOeNRKsAng0nJ5LKFT5w+n4VqJXjUvv7S+qlagNwZJQtS+Qb4YiyvLaqYYfO0nOZtIEMrzny
	jhBQM5BZ908JOih3gGLQqobR4UMm+jMnkMhO969fl1yj7y6kZazRBO9OlebOXZWVmK+mqC4KMdt
	2YDClacyYJqybpO8LD4YghPXZVTA2aGS3IO8+iCBi8ckrrHVCz2+zY9xGFQYLaYEp/loDIUQSs6
	Ya3temXzf6iYnAmIsYc17SwTDAayML6iVwPjW0YxacX7uIg7L+FVRfXMdROSehaagdt2ZIeXPrS
	NJ
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919253eec.8.1795515799020;
        Tue, 24 Nov 2026 02:23:19 -0800 (PST)
X-Received: by 2002:a05:7300:cf8f:b0:386:a728:6c12 with SMTP id 5a478bee46e88-386a72873femr7919228eec.8.1795515798355;
        Tue, 24 Nov 2026 02:23:18 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm40252277eec.13.2026.11.24.02.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:23:17 -0800 (PST)
Date: Tue, 24 Nov 2026 15:53:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] usb: misc: qcom_eud: clear the enabled state on
 disable
Message-ID: <20261124102310.q2o4ajmvbqddizmj@hu-mojha-hyd.qualcomm.com>
References: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
 <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-qcm2290-eud-v2-1-9bfc432dee07@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b056598 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mksB-i68-orwwBDzz5QA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXzoyFJpwZ4wzL
 iHcYGBH3B9P9c+oTzL4X/XSgQFHdhSe59nBn1H+ShL8/tIDLiN/BjNP4KXqsPy5rH4/UIqvlwZo
 ofRhLQDKeWNhXdP9+qgXu3J6SxEfD3hAwioXArrHjSVGOx55TLttGcKNFabO6KdwToCTADcOkg3
 66HT/ZBcqR6DYvrdaKEIb3Hfcfe4Ry7rnvasS5fT02wvSkJUmceSHtVAo4G2PQ939cqhk1x/fzT
 SQQcqKQIXgyzTkO5+KllB/j58qUF5+E6CglCV+DtOC9ChZiZJn0xix6vBrfV8PKdn6CSdlpWcq1
 qf/sSdhfhK1dO8zr+T+iNoZe6j0eftl+0/hMox3OIA6V7Qs+548AZ3ztixdQBHWuOhwILk+MiGC
 KMDDY6aMOa9j8QveDoo64+P3Hrd7/G/QcErGogoh0UG8fNLIkd6117cwetmryCRjPHJ3KJPj1jM
 N2Sa4wnkMXxMUVq/7/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX/sveEV99D7Vj
 pN1XAxZeDPgpPQN76Vdz5YvXcdjfqK/G2rRNuyx0eWH42BbnQJfFXP0x46fpyBzWdEDSM52lBy9
 NI84HotEBchk2vjjUDYEYIm4bg9JLIs=
X-Proofpoint-ORIG-GUID: fZTZUxZNIo2FwYp29eQA-OojBa_deJqi
X-Proofpoint-GUID: fZTZUxZNIo2FwYp29eQA-OojBa_deJqi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Mon, Nov 23, 2026 at 05:42:56PM +0100, Igor Opaniuk wrote:
> enable_store() sets chip->enabled when the EUD is enabled but never
> clears it. After a disable the "enable" attribute keeps reading 1, and
> eud_remove() disables the EUD once more.
> 
> Clear it when disable_eud() succeeds.
> 
> Fixes: 9a1bf58ccd44 ("usb: misc: eud: Add driver support for Embedded USB Debugger(EUD)")
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
