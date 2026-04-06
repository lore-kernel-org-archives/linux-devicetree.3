Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F7231353B
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469518; cv=none; b=bHLTn/hHKISrfW+z0a93Jb+U0GRLyYl9Mh5tKD1YR/PMYcymOyHt+HdZirTuecvgzqpRSdliSt4y2gQ4YiiAhOhy2OIE51TNNtscY+7a9P7ibRMM4+l/pfy5jp2kAneD80Nw+w2XF1P6Z841sJt6KQcjYVH5/oIbNK648boANoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469518; c=relaxed/simple;
	bh=qjB9Efsy6IkWbCFnSQg0/51oe8oCnJbjksHKC2fHSts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/BgsH5+tQim0E4nCuSUnXFVLn/JENmDQwAEKQW9SRDxE4u6FspNv1qRNaA9bRiX4vqzvC3K6OubLALWxgRygZSB8Z+CwRGEAlpYQlTF2WSePSWNZY4vGJPgQHrtbos2f49B9/SdXgsfXLuCpwxp905P8hjj1h+ycgiAMpqoyug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blXbdB0R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q+TqpdZw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blXbdB0R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q+TqpdZw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63692Gqq2342418
	for <devicetree@vger.kernel.org>; Mon, 6 Apr 2026 09:58:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=; b=blXbdB0RP3GAG0aN
	bnA5paiQchAlxCR4B5kHKuaCb8AliqOFmUKY0HPVG8lc1nXLTTOgm0pABxBAh4at
	Nh6ardb76jZ1MlAjlSjiVnEEThj8xOWMP6ZrIN8/mIQ21D17P6+MhVL0dMUWXiZi
	xdQC+TODpGZwL5srnxxbIetssgGAldxbHT0UsWzbCh1Kh3PxGJH0/FOdadkqB1dh
	JP9a/fK2H6Qu4G9ieNmJ09C0JvJo8PdTdWGDsXWg29Sw+hJN6mdsQz7slEuEVB+7
	lWOSLLb2EI6r/j8kQ45RIil/cTErvtuvsvC1eABUpVFewA1jYZmmvH/FZmKBf1Yb
	Y/YOkQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4darbfmycx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 09:58:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cdf02bce5so2435077b3a.2
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469516; x=1776074316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=Q+TqpdZwBALvng43x4P/PnHaVPVegkCBHrqz5eniKvA4jTR8yDp+lcsuhM0HHbOYGy
         CF7zxMvhYBQPdm8IYZJehZ5HqTu/z/aQcYWDIlSfXvPtbdEH+ZdN8r1GzU5SDCT/VrPx
         SePuXdGxwIkqgMl/PPYlO1rs07wPDeXTd3lxVIjalIDqGModhCnSj9711nIAVkePQfUu
         y/fQtVoXx4CW8HEfpK/WNTrYJC5W4DxuRd+VzOwY6WbsllZUEzQz6xYOTErhmamq/gGD
         eS89FDZ3Gm67Kp44tBKrjtQ2S7A0/kchBfJnY0FPRXXNUC/sYObKscJ69jvVvCAeslM5
         8m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469516; x=1776074316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcAROAuOTYgA2N9J4X80A91Gy2H4zB/Gk4RTQ7wpJpA=;
        b=guiCHraTLEreF7VEPJmPWdG4taGoBMsO56eU5ChXqG0+aXzWss0Mrb1kIiuo4jgXyH
         mzWwltpq1hdNg/A5ur2HdOD5vSCdQY7ehCYXAQT/hOFvkKL/MNVhz4SwN3qa+s6SSFL7
         HI48WrlSzCZsDIrlG+WB7gbOKP9BC9MAxTgOP/YhQmVFfoqHuACAVkbp1a2hwPMwL4/j
         d9EAgLCFrmYarITZdd42Zd55BaHwSkG7+UqzJyK57WNmGpRZgZ9ykKWxYWXhiW1QwWaI
         8QjqD6Tst0ZqXFgl0VWfVORN2APYgGcL0jvmAnGg+dKcMFuCCjTf9LD3PoGmvkQkRVGm
         J2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVssEisnNsn8+pP9GtuouiGmMveEngkxt7rJ3D3ZbXq4XXzuUyk7ao/CAozXFrym4DRqJZuFRyutbTI@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQMmZpALdpP6y4WhysS7Waa+1RYVbZpeLskvJ6AA22mTnC++g
	D3Gid2MgTwum5lTUWoas9htsAQqlCJPLuykhlU3cxx0T2TZQFoDdpDtB/93qLjjv0tqTh+rmkmf
	4RL+xn0+TxQBqSg8qiD4oWWVyAGxDhJJVA8mY0kqNFgCLECq0dGT5s52hmX60wiM2
X-Gm-Gg: AeBDietrG0P3bgqNAs6jItVXkScm1eo+ebtLAqa0O/ZsPJa18PitAYFqFZurSBzwMf/
	0NS3EF2rqDuJM87eJSvORdHPFtLW6cAhCVu2XK2lAhYYBc1yfX2KFF5rbHny2TJgwXIwC+JiFv+
	jWBRD7q508xIypMiuCEIbe9SSiaViMrGlrXQTpwSFpZm/ChZ0Z8QBWROZi9ecO5MM0kmysJI/US
	hJFGmufvvFqiUyJSplRvgyLNvpV0X0vEANaYSX3tIdDrHmYpfrNkysBV5fEDaPoolgDK0teyWZz
	BN97mDM1UHnR+G6KNhbYrNZXv664NoWJ3FATffUG0gUD/Tb0w6w0W0j0iiW3jVHpqpxCT9XK5Sg
	vAw6O5gmfgLJhpnBHktkvAua9B5x8WnVhb4Rstedn2CkouQ==
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013571b3a.26.1775469516080;
        Mon, 06 Apr 2026 02:58:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e1e:b0:82a:5ef0:20fb with SMTP id d2e1a72fcca58-82d0db53702mr12013548b3a.26.1775469515578;
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b23c6asm17723022b3a.10.2026.04.06.02.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:58:35 -0700 (PDT)
Message-ID: <f2b9614e-140c-4407-b4fa-ef5d7c9ac0a4@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:28:30 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
        Jaroslav Kysela <perex@perex.cz>
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <177511857667.2917822.6371182180784837499.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfX09rgNa6X9HLd
 zmmUAE1YHM9hFBGILxxI1Ns4mt/cYQ6jOc+P+UGFJ8UlMxtkeLiDUVmU6mZjlyZJU0nesnnv9Vp
 /UIvqHs17BtHogDFwsdMvNZlabDj+v8pNIs31vRy9rfQvGPt3FQyDPXpWdhfm/KwFbHuH0gPyDX
 YieAPi8y1QmJ4r01qFzkFW560fVx9Ooshh21ORnHT8qtTuilPLa5oeAlnh8nqSfzZ44PXZDDfgS
 AVK9RoBqkdbQitxc92uRvR0Nwb+QOsz4lRZjapRLoBQq/GyN8bLrFiiKywGS44caOTTPtk3Um+t
 WhI1GTOX1G56h+GRohTg7nEjecWr9epbzcNJBSmui+QOus3JgzLq4sLrD3GvSUWGQs2pnnZQKYN
 +8yLhjYL/VDfTkyTAkkYV5o/S0J+EO+ZtU909GHUws4INCvIt9Pe7c974FcwZhi0GtOaO/zCrUs
 Ly3sxkiWm3oHw734nVQ==
X-Proofpoint-ORIG-GUID: Q-ao82Lg2HrS10Pv_5ifkjoXkYqzuAO8
X-Proofpoint-GUID: Q-ao82Lg2HrS10Pv_5ifkjoXkYqzuAO8
X-Authority-Analysis: v=2.4 cv=I6Zohdgg c=1 sm=1 tr=0 ts=69d383cc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SdGosrV6Qt3YffhYJa8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060096

Hi Rob,

Yes, I was able to run the script as you suggested and find the error 
indicated. To address the error I have removed 'type' from the 
dt-binding property "qcom,always-on-supply".

Thanks and Regards,
Karthik S

On 4/2/2026 1:59 PM, Rob Herring (Arm) wrote:
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml: properties:qcom,always-on-supply: 'type' is not one of ['description', 'deprecated']
> 	from schema $id:http://devicetree.org/meta-schemas/core.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> Seehttps://patchwork.kernel.org/project/devicetree/ 
> patch/20260402072256.2811085-1-karthik.s@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in*this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

