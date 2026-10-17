Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D42E3BE621
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259339; cv=none; b=k4LjKk2/8WwWyqHLiSL4VnGUxHTjSFcYETEdqWi2RTEAcABxCf3HeCt2Vtmxi2fOd2yNTZAriO1rlj/T1v9nJ1xKLqKU6iQuRawZr+3YpDlHsTKPiIuIECvEH51XqdnfA1h6SuJXI742ExknEdbIXT0Uq0tzJo4OKB0zRTZPzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259339; c=relaxed/simple;
	bh=Aw/rmo0SoMK4/1lMvg0jDlp4PW6t+/JYcPEVs+qk2SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cE4CXvoo/Z3Q0APLbPgbN/8AVl6b3qVbNrAbKjcgbKdkLoZLqoF293WFSIAXIHH85jKJmt2RF+y46dMNhyt4knjAO5BkzletdO8US3lNNfQw5sJYRL6aJo+0IVZVMYRsWMej9cb/KBd6kDro2KG4Dd3twuSPIFehWd34OMYHxYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBmRWW19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gQR7WHr5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBmRWW19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gQR7WHr5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA0Y5940548
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:48:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=; b=pBmRWW19n67uiEGr
	mbT51M6fvZ6VAFyrAkl8BlM1cMc636y5XnCOQx990UIlWHlsOUcQeh5umXvxtUKz
	j6qrSCLUD/o66mnrqq+DO1E/x/gCYNC8G1QVIZqR7rsfsyWWsk6L2QV9kTLMphAF
	405KNjZw7Lq7Jbj6Vi4eUZDcB8wmAK6ON8MhG3DHH+9ZkSRGzL132LBPwVn47Z6o
	3UAWUU1eCQ1yVHPYBLk4K56krSEsFGoaFp6ti/6zFCy8SQWvXpxML3DmCeFSvAq3
	woBrsRnfqMiP85VzEK2FxGniEGvJty0CiUtl6JogOUOKLjnJAvqQYsi1IhP49z7m
	UZRzmw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se1d73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 17:48:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3548cdfd2fbso1231618eec.1
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792259337; x=1792864137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=gQR7WHr5WWNc+snOSZhWnht9TsMm0jUpmypnPf037sFK/FZfKP+hsS1xSJA36hpMw+
         M/JHpJMue78aMDKH5RONbOBMitM9Yd1EU5PDvOogs78aG/d0hOHniXDo7GWqWPgn1/Et
         YxeMMlCFrJ1USgE8XjvPmqTGBMGVzGnvBzh0zFQitnXuAOceb3czvGs/VgYVMHqCL820
         pmh6VPpGqYSV8Er9LmcMseS6Kndm0t/SlEdRXCMnizTKGhNEIljrWw9EWbTRfTMSjs0q
         ZJBXHdV9PkGFwCU0COaGf7SwdksHOBEiI6UQVXsQ/MmHm3HuohwOU2rPuyrN7/jRMlZf
         /76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792259337; x=1792864137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ou8ogkNR435OrDIBgnY4JKUYxvqILFoUJ2x+sQgdqc=;
        b=vlXmEnf+UaVD+ZvSAmrBJhuvjjtetWmIRyEy23h9ML63Op5PogWn1e0SaX7P9tSL5f
         qqmlxySZB5ZClqE3n0gjeiKXBKnNr7jKytdaEwmm5Cq6bCqQutPY/4P1QHR8MBdypyUM
         Y0/fprtb5sWGZdCNddkmxWUlCQ2ykFLb/TlpMoGh4uW8oeXY19ct6e2hijnFJ+FHCKid
         VzErhViUm2JTKJLBM0U7fC2tJq+3UcWeAOx/L3DEvSsaLmVI0PHQsYWRGbfTsEmMcHbQ
         hizIJb4DJunelSks097fFLpmWEOYJxRJaTsypvvqTU4uAR+O23yvxPra24Fuc3gHnmRw
         Pbdw==
X-Forwarded-Encrypted: i=1; AKwUvBxz+ouEi5Mg1eDQdBvJrS/T59S+z2Y6v4Vpdi95mwbXZNTtpEjSR7n2f2LsHZCzlt+34wA1cJIatsH3@vger.kernel.org
X-Gm-Message-State: AFq9FYKH/59n1/RcWhFaJDCjfm/noFz7q0NJaNphhAHBH5RMMzFZnL3s
	7WZK4/PrFEt6U+E51VgKTGTunhB6eD3f6hReCwRanpuoGqXUVSkcCxKbKxz8R2k/fuw0e4xM4zQ
	e2FTYhZTG1bt/wzS78CmbcRqbLr2qaeWB983XHx+moOHQVhQezwoMt0RvIU7KkAtl
X-Gm-Gg: AYBFou2Iio+JAyOjb31XOnFYoS8n2PiWNRl6OrPz/lOemi+oShpg7LsbeDFqkPAW2FE
	BdnuO5bCp/RqCMbWcuXrPgGlqthFXDD7NFczpjlf6/dhv1F0kRnLYTsT1gZNLXBeN1gwAdS2sQb
	aASHQO5De8RYl0rjBwnPaeCuTI/vee6dgzEH/ejE+D9L9emOcur0mCNiK0SSyVtCnlYWJrPqaua
	R/6fYvlV/sHB8KJyKIdvArJuEcTfg7zSy3py3+zpKr7PyDJeH7/O3bO6k7BAXD8ittZllibV4h8
	6ywXdqBJ3YMp5573zGl04P91sKeX21cyxX+3oXRmvQcLEKdj2VwbIBfyNEcnF0PUjQJCT6Eh9pi
	6yLyU66fRUp0XOkjoj55IJfL+XMA=
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604669c88.29.1792259337053;
        Sat, 17 Oct 2026 10:48:57 -0700 (PDT)
X-Received: by 2002:a05:7022:294:20b0:179:a1d0:be39 with SMTP id a92af1059eb24-18513109770mr4604632c88.29.1792259336472;
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Received: from [192.168.1.8] ([115.98.177.53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm15651224c88.18.2026.10.17.10.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 10:48:56 -0700 (PDT)
Message-ID: <851434b3-4cf1-4371-9b4a-57dba8022e13@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 23:18:48 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] dt-bindings: phy: qcom: Add qcom,sa8775p-csi2-phy
 schema
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>, bod@kernel.org,
        vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261016235502.2274268-3-anusha.nandi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mumTwkW5ptsxkzy22XWX2d3uLCy5oErN
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad3b509 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=iaXPdgsK/hfklW56b25dCw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1xeFRXLZlQdsslsJnZkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: mumTwkW5ptsxkzy22XWX2d3uLCy5oErN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfX5S5S0yn2Cyem
 u/OrRxF0Vvxw4av/pgkgklSftRU3jTf2hOAGSPmgkPCMCkBpxlhvmJAFzXbGWB59NuLRC/UPqxb
 r+DgBgpN8Oq8U/sorzTZkmM3bgIHW7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA3MCBTYWx0ZWRfX/RRXSZ+BoFJd
 7ihgdBgwC6yJR9K6e/nvVKJ/NcFShQZeZ9BuKimhJ8pQZoirHN1yp3PQyJkAccO4ZVew1IVmFXd
 yhRFVG9Iz1iyXCnju8qaHozIRvwyFXAnuOVl+FEoVEGwT8oA4BR3ACixypdSd3NXzmUeS88YPRQ
 xvnUbv+ptmHo1wXmlnCjdYXPOSI4DZD7ovHtrunApoPuvR9lYkvpIR7G37fYiDxw6GkFieZ1AVq
 Ogix4StcYSINKJv5KeEDddF+DAsAE/SAICOhXd3uOFKl9ddehRkPd92cV3ww0eF+6hr1bZEDUK4
 bXSVf9v+nYL5i9zoge4KZjyDuAco1Hg9Gy2fHesoC4W6qqvFJFANBBXGPOsnbnpOvbpxkVR2CbG
 hwrN+ZzklOLT0fbC/o/a7HqJXsvgOqLC/xIZMoLpDQESd8kAv3POqcAh6XInUHWyAZ7qqlAnynx
 xtxgMLKe42RBzzGm8aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170070



On 17-10-2026 05:24, Anusha Arun Nandi wrote:
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    csiphy0: csiphy@ac9c000 {
> +        compatible = "qcom,sa8775p-csi2-phy";
> +        reg = <0x0ac9c000 0x2000>;
> +
DTS uses 2-cell reg but binding example uses 1-cell. Please align:
  reg = <0x0 0x0ac9c000 0x0 0x2000>;

https://lore.kernel.org/all/20261017001116.2318647-2-anusha.nandi@oss.qualcomm.com/
-- 
Regards,
Nihal Kumar Gupta

