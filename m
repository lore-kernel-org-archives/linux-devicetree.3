Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC023093DD
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249870; cv=none; b=Ed3AIWXEIAOaEU1XLivwtHekeZVa40U9Cg5yzKKVx4txKZe5oY0CFdTOr6CORmRacf7lcLGdPCtSy0lQ3dO/3hMNS33/avDtfveToy7BDrXwLJG7+KzsufAlEO00fsdKDT4n83ctN0tyTVI7LIfiKF+W3az+uQnYs+JyJHks4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249870; c=relaxed/simple;
	bh=qU3rvddbEAEf+sOsgGpXhGYeMFA0CB2x5S7vdbPsjlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnDd/SATdVNS1yhIz94UKxup4bUKo8bmJJ7ARkPfRZAK14MP7Nz6p7KAKj+takeej3E/bwm94sIBVm7/7Cbs1WqA4dMm1Bmr4MngqDFtaeDnERaO1u697v3MuRYQdgzZfzbs562m8zVfbF5H4ZXKztD4GdTDefglrkCskk91Dbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFdRN/il; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmEOP9FU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFdRN/il";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmEOP9FU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39uLE2411938
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LqKFVOC0j90WTOOl7IKcMxfD
	Uw2Bsn86Jo/TQGF3Tl4=; b=MFdRN/ilDhylgFTY9jwTDhhgWfuwzMp3nlQLIIgp
	LShr6w7XlAIihowPQ01V8ot3nd48F4y7cy9viqQJPLBKxQfRokwFhXXEoW0Smn9J
	019/SJ7lDIymGzHkiOYrXqOTfPoT/tJQcHd/Innzkp1CgEJ/OaytiJrWSfYksmLR
	85BGRDUCzIgyodPaIyFarXNbFLyOKGN68GqF4ABsR3D5Dlnx5mfye/FWtgxXwl4x
	iD7Rq5qBMmJ51ADhJ0zuxJvjNhzQtrGvXqQeDXsptnk3/6Wj7j7E/wlDT+AobESR
	EyizJn0dW0AB3AO5KLzZ+OBRf0JCLS8sR96pJCmT5mMAiw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er165ak20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:37:48 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-59bf1a43cd9so2547631e0c.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781249868; x=1781854668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LqKFVOC0j90WTOOl7IKcMxfDUw2Bsn86Jo/TQGF3Tl4=;
        b=QmEOP9FU4MKSigAeYYwb5aSQIjOAB0NvRe+M/FGbH9mUOPUUbur4bn1J4yqa7f2WBJ
         jmF4n17Vv0y7qyBCRdnU/kPiU9VDDl1RKYONOTaDxqYCSxqHkh3sFhMEjVTxd2g9xGk9
         ADjc/q6uS+++WVqtVGiq/RxsQcsbcOGQKQoc+BT1NeG31slj6Rm0D2+hNMbDpCcNL7Lw
         +09XTc2KKCh2QnfHAS1fcy4pHC4Ir0cDHF+5nk8KD9BPjOxBlraEZCHyHIfqOtBWoYp0
         tDaZE3/eAtxkjIIC2db+l5fe7AVYstq30/hCTQBkMk1Ya8qLKpDRzU6ZYVXq7ikc9Otg
         Tx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249868; x=1781854668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqKFVOC0j90WTOOl7IKcMxfDUw2Bsn86Jo/TQGF3Tl4=;
        b=L5MGrmoj7PDgGQ+cOcnJscLvFPAIi29ODe08dmedBlqfvDZwn6FwzM0uO3MvuI6UmI
         HfIWRE6XKFfD/fBmRnoNwyhMdUlfAkgojH7r3xVlnDLPaeOoFvvvJY8U6TTZ8erd7D3e
         u0f681aMNBFqi4C2z3mIAxYOfJN7Os8jspIOfEme+8xqnTQwqS9Y7BN98LtRl3T256q+
         qDakbrrDhWTQxfW2HICy9m0S66wAImX8BiW3eV3EYySmUUsVqs08jE1Jo9E7uwA1eam9
         ryeaJsDPXHFsaiNOPsQxsMfGdhjZulZqqAPiDH62bTit329hQqrOf+8YaIq18mgN4sIl
         pwZg==
X-Forwarded-Encrypted: i=1; AFNElJ99+nqh7Cx1WusNDPRBGWR6sRnwY8DVeRgEGNIB7ou/sOE2xyOI0Js8zY5UP/Lo98UQtCo9XRY1MAli@vger.kernel.org
X-Gm-Message-State: AOJu0YwEbAGySVF2vnrrtjQWzUYgij+0wKRbcM+ZE7eaKePbnBKA38v1
	2MShYi1HQ6smEVAXWTGzASS6eo3DYmpCNTNTgbCZv5dBBu6dC+zwx0o2PhfgeXDMv2INUbnOY8V
	KYofFVcmcpbZ3XSpvXL+HYZAnUY0l/0Q3YOjzNg4vy/2NUdEcfj5kWnIc60Fq8Tch
X-Gm-Gg: Acq92OGEjWKKz2pJzi4IH38CLkFX3iE+oNAljO5hkmYtObcH0i99sPFu7jvgiU9ngTp
	uVgmNdhNf9Mni+WG0Ph4x8VIzm4UVjtEbEdqohMI3bho4VuMTLJyNUzybjtyC8A6zNFUHn14veg
	/otstI2YeeEqIUp+bDNEe3ALZx+1ZWNWc1pKLa/R3M0Ur/l8cFBiHIvXY9Fd/7h5DNqegfseZTu
	cYny/5ZaBTdFFtadVhRMik8k2xDt3r24YgS9/Ll36WB6uEwmOM27rPlyNALclRkkMl3UX6qtuBE
	Oc6tzJHp2SkDRKrpkrsrbY4AyEf3Bsi59ecYS+hia+ZYj6YVj131QM12r7jn8vwkpIGKcrl4auG
	HjJ1B9hO2MLZhTewmORV9QHeGuE6kf5mAyC4Fksx/v2QWH7UBaE+7/Z3lgPAr65sBHWfvbO05vP
	IdDehc2mtRjVUmlPSCBw6p3iWR9DAhKzO/LwA=
X-Received: by 2002:a05:6102:8604:20b0:6c5:94a0:37cf with SMTP id ada2fe7eead31-71e653032cbmr641071137.8.1781249867910;
        Fri, 12 Jun 2026 00:37:47 -0700 (PDT)
X-Received: by 2002:a05:6102:8604:20b0:6c5:94a0:37cf with SMTP id ada2fe7eead31-71e653032cbmr641061137.8.1781249867532;
        Fri, 12 Jun 2026 00:37:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190f5sm3867201fa.25.2026.06.12.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 00:37:45 -0700 (PDT)
Date: Fri, 12 Jun 2026 10:37:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: Re: [PATCH v4 07/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP,
 MPSS remoteproc PAS nodes
Message-ID: <sut2627vbby6gtkv3mrldko5nsdlvvwxozvwyk45xykzmgly63@6ke5dgwfhrqi>
References: <20260608-shikra-dt-m1-v4-0-2114300594a6@oss.qualcomm.com>
 <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-shikra-dt-m1-v4-7-2114300594a6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfX8d9MTlRUC5Ov
 Wbdm2quHL/NLxmsTkwmYxgDROtmOgyECs4m07x94uelJWLNNPlSp2ja5l7WJvXMYvE4Qfrm1CTO
 zNsFy8IjgIk9tD0it72wvvpvZij8SyejXB0zixwbyXPN/vcaAkBiDiAWPDVtZbfRqp5/8O8cDhT
 oUBAtzqlFsN5ZhcHowNk629O3U2mihAuQdw2Ybs1H0Ji5nsRptu0qklpC3SI5uL8uJYUcQHBxbH
 hxHQXpUF5l0MDxOXuUj/bcn1T5o1AD7Depx9VxxDoP9QV8KGd9WBMq2kxBV2XoevHbFitl4gaWt
 fZ1+fPsaNuMntk+nGIYO1Ad9PTzUKTMRAEOIf3rC0OYsSnnKvKhzKk1IooO4jVaTC+JMaBfELQV
 Q7laL+aZijBCo0nUTyUa9P1HEM+1uiMAeXSDnBjKZ0ifJJp1JjmPuOpcpCV8WqkETiyK7o5W6Ig
 +1D4E11Nt+rycbaSOPw==
X-Authority-Analysis: v=2.4 cv=LNpWhpW9 c=1 sm=1 tr=0 ts=6a2bb74c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=l7gszL_yuYPfzADJGiwA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: ZpzMrMubyZ8Leip9l_VCynGpB41Dwvss
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA2NyBTYWx0ZWRfXwe6sShOzVYCf
 QXAsJgcP1dvZzd4CbGg0FyMa5kNMMkx1fFOAGz9O2YCn7HPtzHzWmTYIZVlR2pYgZVwAYPBjVvF
 bkf+8DWhkPpne4xHc5T3KVy7kh7jSJg=
X-Proofpoint-GUID: ZpzMrMubyZ8Leip9l_VCynGpB41Dwvss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120067

On Mon, Jun 08, 2026 at 06:40:27PM +0530, Komal Bajaj wrote:
> From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> 
> Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
>  1 file changed, 164 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
