Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877E4392C5F
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394663; cv=none; b=Dr8rV0rWP+dfaK54d1U/0WEdGl7FFgFaPI5TLFC1HqGupFNyb2dxzeaegjPYQVFZC5ED2cBnGxGOtcSLskaI1ucA7c3lSgpaMZze82ZqWMm0ylUzacU7fo6ecOHdlWj80Iz4Bgpmf1QpUqKCqy61eJyHdkazyTcD1d2COhXRBCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394663; c=relaxed/simple;
	bh=7ZtG51IZLTdydGNYwr+Us4eISfQlEChsCDkVgTU/X2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjMceuGG5UM07+LyeYergFg6nw3YI3wOlggAuH34rLXo07kDUMLvmIzwanycHMDTySe0Yh1kK3CnSq0FGBjnvvd0CqGo2AUEbKN8ldkIXukQWlB+8xNVC7HdU9Qmo97h0lUCyR8Zzfw+oFP3MX5BF1zZdQ4+WRjen37qf+S7K/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFWvsc0m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CY8d8+KH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFWvsc0m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CY8d8+KH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0dEA1200578
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m52tvn6ZedywlQd/Yfs9lprE
	IgWgSZuxsJ69OVTJm1U=; b=IFWvsc0mzlwWF5IldLivUWX4/QycfW+J/kxGMwsk
	Cp4cX1phyY6ZIt9AFxgzrblrJDbnVSRSMe+DB/MEFir9AqJE9aihU/peJ6+KMIt4
	87P2qaT5RJDDK1rqSlkUsD4Z777oRrqjO7JJK/oLoM0NlBEW7/HrxA+uQ+muSB6l
	kGQXfn46i3t5N58AsUiTBPH3ljiYYnFINCfKsPcrATIaWQ6XLMxug0AKRJJ7XwXe
	u2gdQIT2/hU0nNuMdiP1QlgdwF50StV5l8zyv6ZPHaT+Gcdyxy43ZMon7Eo+gSDD
	dWYTIEV6mlxDxouO99Di2TRloskrmtbcotahqJJwPoU8PA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdevs6um-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 14:04:20 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bc8f608979so2436620eaf.3
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789394659; x=1789999459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=CY8d8+KHl1aTJc2Z7o96s2YdKnaA2kKZVnVMCGbRGMfGhkOTXhx0JRButtPnl0YjQe
         cy82IkI8hZb4JOZwHGvJTjPui8LNMhdrRsB/jEcDqHiBuuZlUbDZAtIleBgzqfJSByrS
         c0fXoKRfAAzBoNhm04bdk1upbby3jifgKzUwTQjb2Q/O5MtdQKwt0WhO5ogNoV6YodfT
         e9odX/Atl7fFvP9ygGF8c4sSUcTsKgYLl0jgxYHeWhd2PIMcOZYn0fgZUU8jEOzOu50Z
         BapWCFWgeDYcNJI6R+N+4ggjtmaj05FA1EqryHX7NUfoe2HNJcOg0u0P3poGGHpUM3pa
         VLZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394659; x=1789999459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m52tvn6ZedywlQd/Yfs9lprEIgWgSZuxsJ69OVTJm1U=;
        b=SzMuBgygvFNLe15zoLGrF0/wCZjJ2YFbzOYb921OHI8EcAdehjrjnh7fYKsLkU4MR6
         11iJvUivZubvz/ZRx8JbOLwp6t02N6+MI17LdoGZQGTl4V6C8nX3UZZTE/EkCLqP2YkF
         jAEEQppgLj1+WaGzCGMFTqZIGfD3Y92fbZsIqbR0kOF8Ugrl9y6xIw3gLRUjk7eduVQX
         a2hcUkh2M8/Jow3CN74Zw8BpcBfpadUtIwtCmyzINTI0vKe41K2fUyo396nqOKsx6BcE
         dfXk5PBOAUGug+3d5My+zL4XABWebRKvf79B6tYhrVRhePaOy24TXXE7qhnpOgQx3gpW
         I9vg==
X-Forwarded-Encrypted: i=1; AKwUvBxba+dSpv8spa0y2XLUPSJ+09JV3V29b+z1C+NSsXLX2O2vf/z/UsJIeHKr9cBFpzv1JfJ/84e1lc6M@vger.kernel.org
X-Gm-Message-State: AFuF++k3dl4hc6o/IHZn6GBJZVknaeRw8MfmbbJCNwJxAE932yQAGTcD
	3SkGheowJq1nnbNRNtyV/+UYjCH91QRxJ3nUd5UWk7uo8M7Rb+juGOlSZy/wuiMz5yV1RkN/R2A
	7s8mUlysCI7iFHgIsuFfELySk9BD94yZCpfPpazwYREnxhqXhoZPbgIgNNwu7c3ds
X-Gm-Gg: AYBFou12aKxRdm3bv5EWIdDDeYTV1y++2j2Eejg6hdiYhRTKfwA14juuZFaU+R4lMaL
	iMUaEZJ4ssgWvUSOlcO9NMthdHN/UdfNBG8JTReJeJlF299MzrasVdVDK5D8JAHMM/zll8U3I3E
	PA5IMXRJQ2t+1GiXvmHvlhaLPJxhZ/cLnHZEPaBhnR7pqgo5E/uYp4W5q8T6sYNCTtnEp30cK+H
	f7BbL2Zxm8Zhzu7wjLS15f2s177el59AbJ71/4lfuua2gvpazhv+NZjItPtlPNY2qNPpdW4UK4j
	zW6clvcwzH4eSYUhN2v9k9pc6bVNUKUD/3c+FPMJNfzLMuD3B2O6E+2p9O8T8nTKQgGNDRKIxmN
	mNvMbmDD7ell3MA==
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477408eaf.41.1789394659365;
        Mon, 14 Sep 2026 07:04:19 -0700 (PDT)
X-Received: by 2002:a4a:e847:0:b0:6be:19a6:fe60 with SMTP id 006d021491bc7-6c54203f16amr1477303eaf.41.1789394658737;
        Mon, 14 Sep 2026 07:04:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d284a7bsm5983725e9.3.2026.09.14.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:04:17 -0700 (PDT)
Date: Mon, 14 Sep 2026 17:04:15 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
Message-ID: <pngfa3stqy5jelag52kmu2qrzbg2lojrmnuuz6nc5lvfvbdagi@ta4pz4idnu4a>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-4-b9fc5e2ee99a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kA0jzIamKlcNumI6n3YjvnyG_OSmX560
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX47Ulyd4wYtm3
 pPE5YQcRwx+HemVEXiwIQYZrgTweCbko33ubyMmOD7KpeFXoI/2DMQvm29iW5pJ9hgXvR4CRLA5
 VoA1IUFLpplSWVS59J1SgJ/Gd/QgnBU=
X-Proofpoint-GUID: kA0jzIamKlcNumI6n3YjvnyG_OSmX560
X-Authority-Analysis: v=2.4 cv=ftpJ914f c=1 sm=1 tr=0 ts=6aa7fee4 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Uuv_azA6OBGcZ0en5L0A:9 a=CjuIK1q_8ugA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIwMiBTYWx0ZWRfX4AGSpyqEOfta
 7H7Brq63uadGFSxHilgy+5SprSIXqN69G694X/ekm9hZU5L/ot+SepSUGY/O2IpjTwKPGv4CC9E
 HXfVZgXR/xMMfGbHjpC2dKOTeR1EIhmL4oxXYmSsfNUVL+xkWxD112+RpLw5xvLyLcvlHtDVzC/
 xJIVU6LgRypvsEy1m/AF9nsbonz3hjEuv/HUaTiFErBX2ky9CGCDXm3YcboH7NG+e0rhrwpM9L+
 vWhTnrwYvC4Weu9R42qYnUeAynERlawYQN0esrqKUyZFqs9lyQWunKlFJKDUmFck24qvcVaHZo4
 MYRQq9aWsFhZRm0JxBr8t2iBui8aGxyVzbI7itrYyUGppLP8OvrUo0DwEQECd21hKYYUk7BViSo
 +3GTWCelATIAr8aJRa/ZsvuY2Zm1q6S1Lwt4HlKLxMwq8J/+GAIpzV83FN9QwiQ/FYbFeqtSYpN
 QgF2EPAy5hXjiwujEug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140202

On 26-09-11 22:17:08, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>

With Konrad's comment addressed, LGTM so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
