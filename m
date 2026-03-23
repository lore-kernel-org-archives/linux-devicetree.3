Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65333376BE5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302055; cv=none; b=LP+RF35BBlIp5xFly7xNr6Sz71FfU+3uq3YmzIcmS+cIKSt05p2pIdbNGvER3bfVfrUIV+6wcJV43D3vUGcVVbeupae1XfKMIhNtDsU8CwLnfDipUmU63r2o+PF5fLqjkWJzvUr8S6m9664fP1QJnFWSBlNushTu4V9Y+dhIBdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302055; c=relaxed/simple;
	bh=Od0Zv44/J30lc/0f/7MMe4+T6lsAyIz/ZdoZYWBUQvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UpjuCARMZ/3WRkGWL+PsYtoqbR6nTn/QpALUdJ1JUXkB7xhZn+yIb08Zh9yE6StJl+ivwEonmkQ4RbbAXIkDZF3k8oAmk4WjnTCaPxVBwQZs7rpRNgBdlfR5dUgsicGRpyFt6dpCBjVxoCSpiwnKQQrofjawq/kkzeom5nv+VPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PwxnAY3c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dtY4Tv0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PwxnAY3c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dtY4Tv0h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqYx93170677
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:40:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hzymoKs8HF1bDInfed/ZyQ9D
	caIeR6prW0f43Ezct5g=; b=PwxnAY3cymgv+tTRURZUJ/H1MHaH/TMqV5knEYNt
	agEyyjWmkJtEMjaTuFTP0hOsnFKRL9dUAK1/l7xH0NxoxtHnG2sJvI7NqmMdIbEt
	o/jy/a7P+WWXvIisYKR4YiJwLttOO9RUTFeQsitoLkOEi08y0b2toyNSkUp32/VR
	6caaRd7N1/pT+/6BasJAUu7D5SMFtc68I58lxezagDV6LLZ9NnScEY/5iaYhcGa1
	1FKIBqTb1Lj9XilAKi64G4hCKTKJFgCshBPAPAFo+7EZu391mUr+ArC27TzbFD/Y
	GKNWpqijTxO0QfApAV6CpB/oacR0sIwyNtkkZwMX/Ceqmg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21t4w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 21:40:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so38959521cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 14:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774302053; x=1774906853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hzymoKs8HF1bDInfed/ZyQ9DcaIeR6prW0f43Ezct5g=;
        b=dtY4Tv0hnmE5n1X62IgyQeXCMa4m0Lrab1Pn/DBBKTBV/qK2O3KAi46xfeHKMREMT0
         sfJgOVS16x+IPsV08oW3LbuCTESXraO3NwE30Cuyd4lLlUnR8gTMvYhIlFULlrnkXl2M
         B7CcYxQTq1g9K7J+8eJsBLctRKu+pEvzPEtKn7XQhp9XEvr9TuW9Yz5ebDxLMzZ/SnK9
         x0K4G96lcJR2wJs7SinPU5DSwQ/1vBqzUPwVvCMwX3hyPeaTZgDxoUEXZxgcmHnzFm18
         /Kh46ind7soHEOKNGU2GR5E7wzxV2xbs8E/t4MOgSnbMYVCeRiZK5qlC3NE5/b3HTXv8
         L7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302053; x=1774906853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzymoKs8HF1bDInfed/ZyQ9DcaIeR6prW0f43Ezct5g=;
        b=SdC9NHhJ0nM+Q+7udP75a4x54GwYCcXiDZCrUm0xGES71E78OqWZww7Wv33PzC5eZP
         ZuQj4y1Q8N8PqX6EYN5A7ZSsCx3lBx01dRezENO+WHUclbdYsI6XPJcLTgz6o/bPUTsL
         kVR0zrvyJyZ2UxTOXz2l0kaAa6W04hVDbQ1Vyow2MRwVzgwRD09+nyppQ20AWgtFxrFa
         VzWaYdojpkrcSN9ggQXvuGAwSVHteYoKFWv7GdixS8QrAoMFBbTuK1bCs0nIBIuD7woE
         G11i62ZPZ98hnkY49dsIJDGiAFAtf4hSFAFNpd98GOs0rfRfamTi0BjtCRGlxxulpQ1i
         3fHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJzxAAmNEn3+u4X/HCdvs/r69N9Wjuxmueh3uzFx1GO1EQ5izfXyyQNBq4IA6kV5QvUiqTeCAMLAP1@vger.kernel.org
X-Gm-Message-State: AOJu0YywxI+jwZAPrZTs3yAIKGKH7cWBOZL42Hhut3gJ5MVU2vPdQqw8
	klKHtrI6blDBZdrJnYoiTEjgm1NbkpmDQU6lFkCd3Z422kNx9gksSplBq9x9g6VV2dJLQ6PWtCL
	b+fPk0bBvC1NJLmOtf36mnexJwbEbmzJ/lJJZDOvuk0webP8UDIzHoVL0S8uBtfaUygOYXfFP
X-Gm-Gg: ATEYQzxTEq/ZKX7/ghpBxle/wC4+e1DWRO0HoAQKrGH6iBak4mGMWob7wFVDJBLk6yz
	S9EMRr6WISG7IjYu5amds1xj8QH1oypZaLpos5L2FBEJT71TcJlxRVKmtCt9RmNn9aN4F6wLDqL
	TjTa9yEkCmK84sZpQIjOBdCSqIuLquvxl5l9zNsmlrB29lEVjCyOxV+dLJlTn0WdlfNy456f6jB
	hN4GdpLAXG3PbSsexszEIPOgtIkuGxLc4O5G75NI4rvWjINRxg4x/nB+c0F0gHN8ImPzf77ubnn
	KcHtszO26yfxIRf2A4m5UIBPRXUIHzTC+SDN2kBEsjRyWwUoUYYh5I7CVxgNUPBKptDSdhewx3V
	8YREPWGzxHXQqMjzzCHbd7lFw63bvYXbefCNEoSks17FwC6XzW9Lg5tsGmyHHj7OyZdCKfygYu/
	9lpulasavN3VOz1VBLqdogQpFqOiWdh5nEBRs=
X-Received: by 2002:a05:622a:354:b0:509:f36:496d with SMTP id d75a77b69052e-50b37504e41mr205140491cf.33.1774302052509;
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
X-Received: by 2002:a05:622a:354:b0:509:f36:496d with SMTP id d75a77b69052e-50b37504e41mr205140191cf.33.1774302052092;
        Mon, 23 Mar 2026 14:40:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae5c8sm2864903e87.37.2026.03.23.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:40:49 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:40:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: eliza: Add missing msi-parent
 for UFS
Message-ID: <vr7lguh6367anqj6x4v6c4oqop2uuw4kcmssjhoe7t3qveej7r@5tp6xukfvovz>
References: <20260323-eliza-base-dt-fixes-v2-0-59af0627b7c2@oss.qualcomm.com>
 <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-eliza-base-dt-fixes-v2-3-59af0627b7c2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c1b365 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=P4vY5hjairbks-F6ILsA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 9-zClmh2GsS5SyZf5QYWmaTi98dFZ9CG
X-Proofpoint-ORIG-GUID: 9-zClmh2GsS5SyZf5QYWmaTi98dFZ9CG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MSBTYWx0ZWRfXzjg/lLoNoWLD
 ujvRwiFlkIYxjprfYbFwlx7G6Sv3qbCq4r8RHDCnA+fop5bAh11AByJUGE+mr2lhE7EGPoNCfLq
 yN/Mxnt3Xs5eXbw9EorZreQ45hBluevpyDwd9YIsGlv09J5N0ZGkNKwgiZnJuTGhZB+ndc+eQ9/
 9BjLHQ4lAMB8YU6Zgh2u7HFQ7a/tx9NdxBcHQUO97v6bCm1WG1oUdZe0qvXV08kPsN8HXIxbIMy
 gC8jLie+zFpx3riKKC7r+9IN4A96Uo1wiaQsP+PvzVrA0XZe0ZSgqf121zT+qTVkiM6WiyQ0deI
 Al7ojPRteXOmNubVaWqFGVBUWWsb8bEzCEit7QYk7Mbf72YAy1l3QHt4BIPJ9HLruiFGoUjGQiF
 mdmS3dtyv0mMEfRsuWlzbsm10/DjvRRNbbmV5zAgmteVnetlBWXgR057wYPRZlZXd+l7YlgKS/9
 uS1lD72lI1aCFUC7zRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230161

On Mon, Mar 23, 2026 at 09:23:26PM +0200, Abel Vesa wrote:
> Wire up the UFS controller to the GIC ITS by specifying the
> msi-parent property. The UFS host uses MSI and requires a valid
> ITS mapping in order to allocate and receive interrupts.
> 
> Add the ITS reference along with the device ID to match the SMMU
> stream ID.
> 
> Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
