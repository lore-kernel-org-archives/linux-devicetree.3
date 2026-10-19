Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8E24E534E
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410412; cv=none; b=Z7Pc36hIOr5F6ymokYUHzlIXLnXr6IC/wkDxvJ6IbfT2oTYvLgqRji1/W0YZq0De8F24iYDXSUI/v/wPKrTuwRJlT4SujZZ/+d+EFxOqDmq4+gaAanNr1hwXZvXhf6OZnM5uOZtllYhSpWj7QWjQrJOoZFyzz8RhgUJ3z7vbX/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410412; c=relaxed/simple;
	bh=RIX7bWfkRL3dgOtEB0g9h8nTmYWL3ZH6w2+XB9g1exA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To4iMok1i3/1eJWHP35+dCTmppDOaZbX7NpmTi/7r9Gxur2qgz8KBsqDsN8O2h566OMgeT7frnPD0680AnVx4NjcM/FrybWqGgPvS2RON/UUby8gQ95BpJxT+NlmovvidrOM3Xi2EUsHp5k6V6u7TdfjUh8b0Db6Q0dQEppudZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hqhkTMBr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsKMtSQr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hqhkTMBr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsKMtSQr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqnX1665414
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wq7xqxfmXPZkOoAo9wJ+7Vs0
	paly6CmBu1OanMzWHA4=; b=hqhkTMBrFAMM76BtlZZFoX7pQGmmWKCVYbNC292q
	kXd/P00LzcmReia+FM3AlkQkSqpziCdz6VuizoK1+MTk78YtpHYKDACngIl8/fGG
	s2UqnSSrORZIsqZVHYC1+Vm2JsWN1dUOGCSVVtk0quNBAO2KoK4rtzd+UFqEktGR
	etojQmaat1QHyhcGFFuI/0QAxdrHotkI5JWV0+NEcToq6QbypmxwvkQVdptSSZS/
	VQuvIKNJKqOw7J71PRoaOenonVRjMwZ5cFWMTDjIlQKjahXVPbR0GM+mzyzXdDdP
	NOgVWn/QjO3yi7Rm2Rrz67BiEuI6jo5SKjGFxAjF+/UqgA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n0w3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:46:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so785118985a.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410409; x=1793015209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wq7xqxfmXPZkOoAo9wJ+7Vs0paly6CmBu1OanMzWHA4=;
        b=QsKMtSQr0c52dkvG3+UQJ7jKJkXRH9X6+Xd1ziVplv0uBo+cvi7fWHmTV3JxtHVsBc
         RGbINpmHYGGMrX5YY0CxgEtq1SyRtYMT+B9KATfEstvzbVEvnDsrPSdz51i8bElbOojo
         MNQqgT8VRgVpdOu0rUHV4Obe5wSloBhWO2K1t1s5nc1XVAQPd3z+CAH54suCqjjVj0al
         u+OH8CK+FhH9yoepvr4XwI5gP8hPdDFpgF3jm5Pvip5jxSKM2UKFEjQBIAc+OXA7vEjS
         3IsI2Npk3oxtDm/txV0xRzyZepgt4f19BSMf0tbBi6viz49xfBwUrApRKu09czfXC98p
         opLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410409; x=1793015209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wq7xqxfmXPZkOoAo9wJ+7Vs0paly6CmBu1OanMzWHA4=;
        b=yYSwJqGK5oDsDw2zlgfz4pW1YR+HSiAh/g4nCMDKL4E1Fs/uU7/rJUhnRf42z8mrSJ
         /b9uJ0mxTrEScmg+nEVPNwH6O5yfPFjTjz+JgTQPgcIhNAg33CFQqzNso/YWg+UdvasB
         sLkVStZu9yNGYg4ewSvgRK1LcIpbvZQthJ14SeA929gHIMpN3MEuSV/D7E/cu+uCKc/p
         9aahgZ0TqqI1MIYInoOb86Q36Yv8o6F4zRSVarx/PMO6OK5ylXDJdNXcXZUroFpVIzQC
         OCgUmTZtQZ0qWiqKjl82SWUvtTXuiRB5lsxb0bIp7C+VNJkv9z7S0PmWC2E4bkM3xgeg
         0rcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFVTXB0fGE/F7R/wLsTU+s7JcXsw4B/AJH7PYAvEQiwk+EvKj3ubLUigSoW0dLYH/JqSP6iiHNI2dq@vger.kernel.org
X-Gm-Message-State: AFq9FYLdnayH8Ws/B2gJhDmyllfvxDMfizeUmxocXCu0oPx9DkReCuhA
	OlgtKsThQ+grcnPNVbjf8deCU5sx5LjwjOuZafJapXmO7efSsFp1SJ4e+t7ZJs0ITfrxfUvKGIv
	vgRI1zHQQdP5vt5XYEB8uPBHpromj1s8A8qPlj1KmBAWQa8B2DEDpgNlIi2fEZJeN
X-Gm-Gg: AYBFou3Z50oboXaVVw1v/IFzdirEK8h/GD+cNrrk8nUBDcYRmop00nOEeC5u35DiMSq
	bmPs6wWvOj9D1cDElEHuJ/SbFp7Og5FivadLdJ36sHV2h/Xb9yg5eqV0sJWb2oMWez7XQng0EDJ
	mK2cviTo0pHbiD8VuwTKBil+J1iOknYxlI5cOEmW9N2YAtlc0PLlmLHE+/i+RSjJXMgJAr6Thr0
	LK9CSz668WZG2Y75I+OTqFIDe2K1ugwsxrm3Sx97yebLg3R8HxV5S2lNowQ/NPTLE1JIb8LaJmO
	NVbmpO83zjJadteP/41l8iOvt2mHZw/G+jp1Vxb6VMMDBxmeK+XW1JUXx6BOc0rB8hWyFtMAysz
	O8utcjyfSF++XRZj6
X-Received: by 2002:a05:620a:390d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93f29ccf82dmr1357036085a.26.1792410409012;
        Mon, 19 Oct 2026 04:46:49 -0700 (PDT)
X-Received: by 2002:a05:620a:390d:b0:93e:4ede:8976 with SMTP id af79cd13be357-93f29ccf82dmr1357031185a.26.1792410408368;
        Mon, 19 Oct 2026 04:46:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e9423f20sm58333795e9.7.2026.10.19.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:46:47 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:46:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: sm8150: add MDSS reset
Message-ID: <m6vg6jper4d7npmcuk2xwraitcprdvuuxsznyxgft22ankdxcs@robz3qiz5ivj>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-6-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX67ppc8+LLSVj
 k5neLxKNKoq6caoWyWFne/19tExZrIbChzA11PtCytjXG7ohCtaeoLHrDwEgJLxiDpl8KnoFQo2
 7Q7+OkDWWYhk7VUN6TMMLhMRudVlU0s=
X-Proofpoint-ORIG-GUID: WnWiVp_kkDB2b5lPBAUI6dlYCA9EwJBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX7jbpREJ5PSRU
 To9EMC2bt8ak8d6NVWnDVzn5YxWIw6SDE5Bp3MjWEAbOk7O3gxTOgmZChWIwzeUWSejspEkU39v
 6HySDr8snEJeiKoq8yVAtDpFJid9OrYk52LJ3C5F9hLAexhtcF2kiRnuDdstp23ExCb91kx2rpc
 zkk0xOFckPcWbz3X59ss4XbvbAaA1CgHWKxQEeIJXqwkP51f/2Kodbm5Pq+sN3CGDLFfKHHzhni
 ECFj0x+L3LMyvn7jYKogWDT5GPRNtSzNjYK35YgVCPp5OQXkwOB6bK3OLaohDf3nacF2T8kHzBW
 7des03JcopYTDv2AkbeZfzb8XQLvhpJ8bwByOaHHZfXuTpo09fmdaxO6B1gV/r75yohnvc1s/5p
 edmNdkC+7AXBQZxVDTHJ7N7ozg4A5LF+3zFO0BNvXFGlGtv01Rz4RdUF9H99nFQcsFMeo61owhI
 bT5fa+H9t19nq1vGc8A==
X-Proofpoint-GUID: WnWiVp_kkDB2b5lPBAUI6dlYCA9EwJBc
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad6032a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8OGljtfnZDXdbyEkLQkA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-19 14:25:42, Dmitry Baryshkov wrote:
> The bootloader can leave the display running, as it does on the SM8150
> HDK with the display card attached. Describe the MDSS reset so that the
> driver can bring the hardware into a known state before using it.
> 
> Assisted-by: LLM
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
