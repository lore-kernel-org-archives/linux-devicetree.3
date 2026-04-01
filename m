Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300963F7AA0
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043088; cv=none; b=nQPWk6hZW5h6kBVCXmWr3lO4DtckvFWTq6RERiCmaMowefVOMEuIutFxcsRX9fAggAZraiR0k3TaRmCpoYjY4AAYkwfSC4k3nBS3AQ1HRbGshc/mFTE9aACfpN3GMonIZgEA9nQfWEv0Zg1C367Lli6/RyyPLJ0fnQQHaL9ysVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043088; c=relaxed/simple;
	bh=bH6OQWW033078M+pZnkDl3K24EuiMHMTgn97RT/t8+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drjjf9Jg7B3iHrw5Q0jSOzmR+sShsrXxw8FQR2nfUol7O78dYUIZDqp85/hOpkPfh09GzNInSx5WX3qPYrTxle1O3SzMzvxjXjqpHmxLpF5ZArMjssjoK7q/xQsa0cyXAXMRrLaDvdQdc1Vcw5qLZYeJgwsMNDdSGHGLGZGGRy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZVe+tEl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iiIueIrE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZVe+tEl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iiIueIrE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6317QoWY3081373
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 11:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r9608+SJx12/aq/uDZkF0WxK
	S1uDQHU8MsIx6PAq+Qw=; b=SZVe+tElXLPC6t6CEdiHx0F3EtRADm7qBjzCA5Gp
	W5+k65g/kH4SrNUeQel2hjCIma3vAV8nroVIdlIJBOLPKGwhlXt9ECgkkjmes/Ch
	MmeonhaI85mNJVPgyd85Q56SPyYC6AHNXRXW1LgE26cwy1E/bDHwphwOzxc2ifWs
	Q28tnDAy+OA7ccOO02uX+6WK8pvw4VEMEeIsUtz7j5kCOYu5UPvLUOtOCTkD21kO
	LFoDrTK2s/JZ1LSx4ma/f+1fKYU3wc+KGUrU+ojGQk7LgzXDoZn/NxLEV9X1O3/1
	fDkGnCzhGbC72osDKAwvdbLvTpGVtF9dAPoMUhZWacYLkg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkut9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 11:31:26 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-56d817b03a8so1067667e0c.3
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 04:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775043085; x=1775647885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r9608+SJx12/aq/uDZkF0WxKS1uDQHU8MsIx6PAq+Qw=;
        b=iiIueIrEbmStqfJ1vFHHSup9Q0WZlNG37nVYwFKJgvDeL5ErX7E8+EoijfT4ZD3KXJ
         9S/qCJsiSJf8Ywx41zkfdU7JwpHR1JYOoqUvxPyDyMHqFc3twRD8HCuksUYUFNhmPD4+
         /SGa81CmRlp2oZbcAb16oViVCPw96oYUlgE1RWHZrvmw4yAhwrcbpjLTGvPYeW1rnblb
         MwZi3qv8/aOWdhidI5hOyDoECS3uCvDZkB6jmEjENwFU65hR8u3cUkyQjRDf1wJVwVjK
         u8eR3wG8212xDU1zWIhUimNtbyrhwxT88fOXJxqLv8dxbKSmx+6Q6ygQfdhh0BqzLfJV
         tYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043085; x=1775647885;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9608+SJx12/aq/uDZkF0WxKS1uDQHU8MsIx6PAq+Qw=;
        b=ILffH4fHT6HNTLcRAZK4nU0TDkx2H7xBIzgdzoX/fZ+WMjHJowl3GEEFXLHc5tbkv9
         hz6JncKvhtURjLhJOne+gleo6xlRIDbR3388t54x9rDnfxfZBLv9vm9R5Pg1pkW2pd+D
         tTqvrDi7RGWBL37k4BDUklb8s2OCaVuV9QexShcbiAoQT/eEsnDtxsDDVEyfwWdvcyTj
         cFDObuL/CvaOONorof2fQD7yLQPwd+u02cIOBT7RhfEl2Ac6dNhuc0RXm3S1EGjz3dyU
         gvPvx56e4K9ty56N8CNnL3Y6ICUGdn5uJQfzgDLLE4zDhdZHGjLlELe6RVodfiMHA7+q
         1gWg==
X-Forwarded-Encrypted: i=1; AJvYcCXwC6y9ENq2Ql8TJPkVcvA3XLamqVTeaTBHQ5fNFBGwg0SJ5o0na+F+8zN67YBRwrolluSjQp3zzUdR@vger.kernel.org
X-Gm-Message-State: AOJu0YyEH3zqJoE7hr/AN8PI/yOBar8xpaosSHavJzsCyaEnEjnGK7pw
	A0t6liIpfgAJelGYmmwBIP741hb08nA/m9PcnXA4/f6bf3bDHaEGHXGufmfYrtgTvRU6DmArV0K
	k9tAZzeQLhL7uGWdsQC/6BdOGjn5IQUv5Z/UxmjQQ7QnVRhJ3dQiu1j0uMqDgBLcy
X-Gm-Gg: ATEYQzyg2Uslhd5cnSVtZPseoMaG7OPN4RNJO2kNLQAHHK9A9GHcoTvm8m2gVBUl7B3
	Za3WcjE21kPV1Fl4BgtIqXVxV7HClIYrSSVePWRjWRbzktjEsE+0LTzPed7ePKwIGmW1hjM2WdV
	6j+zcOZIayWp///PfnddLuSrFiV07HDsDTGhzFlLmdMmQwCnETiaTWGaFFPPN60HH9N6pCo1AcS
	/G5ySf2RzNXzV2JSS71PTbYsByrNn270q+WgNQ6usVq8pEg2BzKBoepP1UugZrITj98dLcKHa5l
	xRVpyaLgOddWKgkn5Bpd2rkWb/cvbSte9dmEUa6vyvXIKaoVp3c85tZQyZbd3lmnAn8vP7pFTWW
	TnO9lR14pe7EqcHIgAvZR+lGOG11pel4WZSFxltHiLmTCE1bSOVZjmBobgda1PpJ+BO7Gf6BDfU
	GieSieD43uaWC0m7kxb29zFNWz1KFkj7reDUA=
X-Received: by 2002:a05:6102:c13:b0:605:6650:465c with SMTP id ada2fe7eead31-60567e07604mr941871137.13.1775043085466;
        Wed, 01 Apr 2026 04:31:25 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:605:6650:465c with SMTP id ada2fe7eead31-60567e07604mr941849137.13.1775043085052;
        Wed, 01 Apr 2026 04:31:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d4381sm29415461fa.2.2026.04.01.04.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:31:23 -0700 (PDT)
Date: Wed, 1 Apr 2026 14:31:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel@oss.qualcomm.com
Subject: Re: [PATCH 3/3] pmdomain: qcom: rpmhpd: Add power domains for Hawi
 SoC
Message-ID: <ht2vvduvxvz3s36cn5m54hv3zon7qelrgat3tnykfvqi7f56fd@t24kmaliap5l>
References: <20260401-haw-rpmhpd-v1-0-c830c79ed8f9@oss.qualcomm.com>
 <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401-haw-rpmhpd-v1-3-c830c79ed8f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDEwNiBTYWx0ZWRfXw/ydAUQG2GZ0
 3UbrTeptZ5k8vJ/YBReHA3/hyF6hLjHEwLW6r5fbe3ROno63y8+/xCxj1OGBuq8XkNRQPpvysm6
 faogfNJ4NYmUhYwAAnEn51Kg8hxp+j8Vu6PRBCla2jwSylVEnVAFEvFmGiAMMdOVK+ISFzFVm1j
 ekiTC4gKHlkCR14gc6ChOteVHU9XLV7g7Tva3it1G89ZTLZzCpoqUOvL0/8g+WWRLp5FXRlnUdX
 c6m9VOdePT//K1e68KR9S3h2t1U1q9b6nGrLtD7Z4F2Vc6Moyn0x752lWFMW3dLsL7YNRbWkYO4
 1gqZIl3PtL3tk3RJEMuT+RsXe2VipIzza5dX42ZhJphsGFT593iQZ5vPAq66UwiCcjLxi1ibaQc
 cM39mrB+sVjzcSgju2N1rqpKy9SiZJY7ULOUWv+tX4MROnNio9+MIvRVmPk15v9heA4P2Bj2rIp
 8RUc/ehdK88tkNJsnTg==
X-Proofpoint-GUID: 4KhP4L4xKpOJYY42exO9yRzSkgE0A9E7
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cd020e cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=bf-_WMFNrYAB6uAn52kA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 4KhP4L4xKpOJYY42exO9yRzSkgE0A9E7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010106

On Wed, Apr 01, 2026 at 02:15:31AM -0700, Fenglin Wu wrote:
> Add the RPMh power domains required for the Hawi SoC. This includes
> new definitions for domains supplying specific hardware components:
> - DCX: supplies VDD_DISP
> - GBX: supplies VDD_GFX_BX
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> +	[RPMHPD_LCX] = &lcx,
> +	[RPMHPD_LMX] = &lmx,
> +	[RPMHPD_MMCX] = &mmcx,
> +	[RPMHPD_MMCX_AO] = &mmcx_ao,

So, should it be just mmcx or mmcx_w_cx_parent ?

> +	[RPMHPD_MX] = &mx,
> +	[RPMHPD_MX_AO] = &mx_ao,

-- 
With best wishes
Dmitry
