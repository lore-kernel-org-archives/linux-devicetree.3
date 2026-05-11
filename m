Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCEE3DD522
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506818; cv=none; b=tjuVielP3ce2tDODL44r+Lic/l9Vw3Wr6Copngo8YNZOc7pArvzfj+0WaeLhLyVXMX/aOzHNpS0pgeakamlaL1kfMurGSFe9u0TRhrko+h89VnGlRxkZJuoxUAYN41+532sjvdlWFzNfXhl3AYdIgNG08ncfjN6D7EGggwVj8+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506818; c=relaxed/simple;
	bh=iv7kN/9CexyaXWUNLh2lz6maV1d9S2gQPdpq0kjz0Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPDgV8iTiC+lREDO3lG97M1fwUV98VYoc+Sa0ZeA+Lx0KMpw6Vp/uBAGaKp5Qt86N0Pn9AZ8QmyWvqxwoJ8DHCXAXeAuMT+eq6JJV6huAXwDPu/202WoZB/fqIv5XfYewrEIJS3mWQgdhNEw/XHWFSNzSSGWVmst/cNq4ev7adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4htGWLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iafbDEC7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4htGWLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iafbDEC7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B98B9i017877
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:40:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5N/UX/mU9KJ4wGcjR1nq8tug
	EB70qgQL0Zgb5R0yn0E=; b=R4htGWLe7Z3fNK+VGKp3RVMO//4Gq54CK1c7eXZu
	aUxeBYhdujeIgdFC4dx1rPLM9sHWS/IrRKfyGxfAR9K27yFtSdhQZ7U0Gv/vogoZ
	lgKFPJUuOTr1e+6o5ZzO58MDZEcMJV0y7zVQvmxYOwAgTC2NXfzLxkQ+XCKqUQBy
	6XIKD67zwyFzmOp/zpJqmNQPA8BTEgOtPenJIpMAxDlKuBCyWFCbYJbgzcGLgKxT
	SxsPGZ5rDXjwhXf1pwpMqhBL5jOdGuiAU51tsK1/XBGCd7yaGSrjGfZ6B+ARd8E+
	Yy00iNOt/nR7x4q1DLdGTnk+ejgMisK2OqSAy0R+/nIfiw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfswqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 13:40:16 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-575242b4308so8352758e0c.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778506816; x=1779111616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=iafbDEC7IGqavh8QWvvSyBaJVNgv/7kgRDCJvI8nfYLfyr+SNcMcmKvEuDEdHSe1P5
         jcAFVoTZ8oKD1d73hMwS9TtNSsrSFhTSfc8Y/+lfxnEO0gkOIxd7KaoJ1mTms3i4Mi9c
         2HKGSY+DRgLT3+XAA5L/rlxkPSIGzbCE11kj4zeYRI3kjGH+rXPZ/E15zXkaCEPXqFwx
         SkmqF4OZGuau1EBXGni3IwS5/1dCR5Kem1d35/M7g5hlioy86nbZNNEnvKr7ifAcMjd/
         nX6urkJbRZAdTToz1QofrDLBuEn6Ovl6NIMkB22LLZkJWfSY0wJH1Q7a1oEbamYHCklz
         baDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506816; x=1779111616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5N/UX/mU9KJ4wGcjR1nq8tugEB70qgQL0Zgb5R0yn0E=;
        b=UywplFsTFm98v6St4MCREMnDIeMmCPtIrj17aBFOeaVvumJkUXKPLDxOtDakBl6GJm
         hnqbhBJcZWffdsMyCjlC2uofl3dGlvsZajXAy9Bevsy/QAc9m8JeLGs9svqdI2/lWUDJ
         +QIx3VzMzUK3bJCVYNXxcDPp81jpq/k1qX2a1nukzuyAHVij+L4x7Wqwpw8DUFezPGdA
         LI8MDohambqdEnnfEVNQ/qN5Lwr6+BqhIAVCtpgzM3X1vB5r690ZX4+9xxM93PeP2qLr
         4Y5Y7qVBwwpvA7FaGvAc0T0Ifn4NuhlAj2AK6jzzbhhlB0BveXumcrDXagREOvKqM+/0
         VOFA==
X-Forwarded-Encrypted: i=1; AFNElJ+H/d6CqD7wQaTnqUgrU6PGeuao7qh4RdVDvyLfz6MMndwMqT2ybY/HARAjCU6cDADVo11xGyvN4UkT@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ffKQKQ1Znnlpiz5wMsCIkx773HTvmdLVReHXVWLWBjf3pS1E
	PGezOUMRnnyFBKrvRY5pQ5phwKWNEhrh3MbyI6+p2zTtwol46+efd3TJPYgaWHZJHOydw7CCQeP
	3T3pdKC5mxRGIDGW63KUz6qzuoCi0tDCa5gCrFz0zEU11YAHx7C8ejW/DuHkafl91
X-Gm-Gg: Acq92OGEPCm/cVHeRoml8eCVofkFP5Drfw/bhzsij2euqsx+tWytpajSjRgysMemxJN
	/QpZx9MkBY/bOhhRJpG+MGnwYKC+h+QqGtZ3E9I8CPYSzf9mSRFrHAcejPg1S+aK/7Bi/Tjc6fm
	glho4agl9HPRvGXUgSmNYdsH1zGAb+WncMTq/079CZ3sOh/dquAe2RBEVqAo2LjoPEGJ+ESoasy
	s9ckg7Af/ddSLIKwodAGMyhwG9hqKgNeMvy3HF4JVJ4z3uPRLBrblFq/apum0QfooK0cNK22nxg
	UUnBX3+ir9rDJDMq+LNH711qZxq57KI11lcKkbz4QYEO+uZhr4I2Zf4138/A2FEJc7VM324/kgn
	+d71MTNW5eXVppLKOTUkKM++9UXYkKo+yQnkFvu7oTIOd9L8McfX0+TgCNoASgLVq5ngTvd4n4A
	xaYD02UcWsfvpF1sE+EgmB8oR1h090fvuo504=
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281631137.29.1778506816057;
        Mon, 11 May 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:6102:580e:b0:631:41f9:ffa2 with SMTP id ada2fe7eead31-63141fa0939mr6281603137.29.1778506815171;
        Mon, 11 May 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956b2a1sm2652329e87.78.2026.05.11.06.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:40:14 -0700 (PDT)
Date: Mon, 11 May 2026 16:40:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference
 device EC driver
Message-ID: <lep27mjuw2kv642s2gvlmbro6zad2vvwt36x2va7v3juoq7lzc@b5kxiy77oqgo>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
 <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01dc40 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gxucJjpxkCO_kLWZwBcA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 8zpEdt1QEQcz_LJhs_VtlwYCMYvy2oM6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE1MSBTYWx0ZWRfX+Hei1IflEEuk
 0XwuNsxv4S6XhMYoQ4w87gtAVmkMyLKA2cq967R+ywP2A+yA6jtTzj052ONLIWemhxBxxGk4UbI
 2LE7h/xmsOVGBn/dUDwTdjlDJdLWYVkYJa1llSciDZUjoxk4/HtoLi+9t0TVmlbDRKblmPjGlAi
 J+nSGT2hRRbxytGa1wyVfUp7CCRvSGjZSgvIxY+oLcmrzjzoFWBsmJj26llG4iG35ebPE8Wevmo
 RgVC/+qB+d+02F6QjzZ6yHoOwyOzSgbnuBJiPmMXgxr2+bzB3NMI88bReU+oqUYRRBfw/CUiaji
 Lu9rEKlsuRK124XM83GlEB2CPf1Zo9Z9RqXLGrUFWaHQuAsgZpL+NyDvNQ4W+ugfcBZm2Qx7svC
 zMdNnb2FowAdNyhOLShJTsiF+OugkPmM3yBB6q3GfqQvPPWCW2SR162tWaMkxUFLnyScFufr02O
 OMa+Qo/cAxxNHCrdtuA==
X-Proofpoint-ORIG-GUID: 8zpEdt1QEQcz_LJhs_VtlwYCMYvy2oM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110151

On Mon, May 11, 2026 at 06:13:24PM +0530, Anvesh Jain P wrote:
> Enable EC_QCOM_HAMOA as a module to support the embedded controller
> found on Qualcomm CRD reference devices such as Hamoa and Glymur.
> 
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
