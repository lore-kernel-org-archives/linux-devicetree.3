Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401D1357D03
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193517; cv=none; b=FqZmym+F4HilJXBTmbaf+VZuY83pFZEW4qI+Oic4TdB7tKpAyzjq28bzs/V+XCZ8rnQOtL+7ElolIOpxUmxMooyznSI/3FCflPDENkH6mXJFRk+GX2iAxfdrNyZsqN+uvPvxHOS3fLgRt3z8dlJ4VIBX2M4zkfVwVaePTzH0i+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193517; c=relaxed/simple;
	bh=87ifwq86+t4uODzj7YLj8bmO1cfTOaQFYyyuAygpcIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXlgwWT6OCxLKiP/KSiXRPxwbt5/F/vlqUGp3NUThQko1j+p8oAs6fqC+2T7FSl0EGhVUUO08bg9RrkpoGOu8ZnnrK9Z8v6q9op1PlU3EUjTvD+vXn8dpF3/xFZlcc83G4blIXOI/rqfCWdkEprc+WztiIm8aYghO7rxKCHFHGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WHbm2+jV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MiIoqnnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WHbm2+jV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MiIoqnnO"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DkIu1734155
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mP45yvqK7ml4KHSvO22/U14Y
	uRcq4XFrwfupg+JvXsQ=; b=WHbm2+jVxyqEIQOm4NqtnyfO0hO6o3ZHTHzxc4GN
	O7I4OxXKAwiL/iq35SnBDo93DRnMx4SBj4MvC9xiuDiuNGE9TqBEh6VaN+EI/U8r
	e2a+1OR+5JsoGbAAcFpk3PzET5DG600p1nJebWjSlCgfVuH38rm/fIjL0eeETgT8
	XBw1YjQU+5JyXw3zUU/CXQH9hfwP4lqZv9n6QKxh+C1d/C6YWLFPJs99EA6RFReO
	0Oh9X7jkKvS2H7mLXWu9kT7arwQ3097pERzoVjjyPBu5BWDSodM9cjmXafEWGe+i
	jBUgcBnRHLVGmYfQE2W6EtwrnaKSHYBpL64LPpJdn87u3g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed063kbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso3073488a12.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784193515; x=1784798315; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mP45yvqK7ml4KHSvO22/U14YuRcq4XFrwfupg+JvXsQ=;
        b=MiIoqnnOf2uua5KNNcZpy4vcszJOamHJixWNFMZr2HtZ2wlRIPM7wK1+gq5eIBTbfK
         LMOHypOdTLK6vauwRhe+3EK/QvThBujcFtvVIWkqAUiGrtutxwsiHuO2zzXFDf9/MTqJ
         d9iRA2YlhKeeffuMBk5CH2m1JBvkEo0XnDN1CcM7L/+GHK2VlxCxd6d8s63qOib/rWGC
         u9rSNfxklZe4y7WIENP3p4Q4PUdae0n5/39d25PxDiiWWO2FfyKSwRXprwiyNXjn/sYC
         vOlgmhXAUn4Hu3c7grj9h2Q4a50Y2a3zytAtRHkIuLZygYytqT6UrEAO6bZhA9eT+0cb
         c0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193515; x=1784798315;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP45yvqK7ml4KHSvO22/U14YuRcq4XFrwfupg+JvXsQ=;
        b=kVVjtLx12tkXT2uvDpSf9nSk+MYAEZEe7xWRqj6gSrPco7KzBHzFew97zTzxLfay6r
         zCd5HEfqtnNkeBkDMXkT5nxB0IXhzW3cTVjPT5sU4ypIrFI0thgfYOyxllsnJXc7+9y2
         tJpkJ+UMmPbn3v8GisFcN+Yope00pRxVVDCsJH4mzgIjz0bV2f6z1XCubRbqUgCO/vmj
         NFN7mfXJ147amh6kJTGqYmpnqoUe+CY+sNi1rIOfiTqV8f3F0/399XiEdi48gfGo38l8
         cd/8+yUihfUCuB4fnaNKm876EiV763MTy57OElLga33saqFezgHd9ulyHPgX7+baws7+
         8rmw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/7hVtugJjs1DcJxrWMRs7oDvMBpy+SgsaSoQ0AIACif5owA2G9H11JzfQKdutbpfgFVeEseOnLsiN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz941Xsrs+yXkTe75JFJLx4r3bJmkVcwJ8E3knStncNWtTT/iP1
	nwmM/P6yCv/Jc07/wCb7A6Sqq+NSx3r5fmy/OAL0hiPOHVMebqoghQP5e/jEB+4eAEslYCWDAkD
	Ev1fa9S/776xX0wEWm5F8I4Eb3942IgC5WsFUBqkv5LDZGYskfGzUnezY+ATZvVWf
X-Gm-Gg: AfdE7ckiK+ZeY+2c0QCAh7dMk/LFxxuHgz45cluWaTI+/DfFWgIJddpi3+De7MZtvdD
	aQP8VoXj0ZnCV8qeLH+9IwEsDHgZbc19L6zcQ4etbF6PDt5wS99psUG/C2aOiZktrW+KIXDgreC
	Zprw34xdIMWBXK//bw3oj/jgo15N3HhCKAuydwjVWUYzCyLNG/xQq9ls74VotuKuudRgu+DdEm/
	4jpBXWWMGe9vmfdEZkfH+gkIa/O9XMEaTEsgPxE1UoO2n8sEL8EQp9nETrOLEQES22viOZEMfrk
	bzK2L4cNxe0nkEq+twQGvT/acQrObotmf7Zo0zkGVcVfbSn1yVYHoUNxz3QglZwxvGQRGMXjIyc
	7NoTHszeDvAKi4U8SGQiJDkNzXAXsxYQfcH5b7l9jWiM=
X-Received: by 2002:a05:6a20:d70b:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c1105145d8mr24781140637.16.1784193514714;
        Thu, 16 Jul 2026 02:18:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70b:b0:3b4:71c1:ab29 with SMTP id adf61e73a8af0-3c1105145d8mr24781102637.16.1784193514326;
        Thu, 16 Jul 2026 02:18:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cdc4accf4sm647760c88.10.2026.07.16.02.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:18:33 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:18:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Anjana Hari <anjana.hari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: dt-bindings: Add missing mcq reg for
 qcom,sa8255p-ufshc
Message-ID: <alih48Y5lLOqcoi4@QCOM-aGQu4IUr3Y>
References: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716083313.2367249-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5NSBTYWx0ZWRfXxAayp2nMCH1K
 O3/+Cp+/hab4ZsBTpweWyQ0WrIG7yeWpb31FXQ+Xp63Zugpl6HhCe8aLuUbzx6zPfmSjDtnd/PH
 JRVPiEdCS5+emsWRXYyO8ZvB3cvi1aE=
X-Proofpoint-GUID: 46FTlwBk-jnV711p54XjGSN7IvRI8izg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5NSBTYWx0ZWRfXwyq1yAeK2yi9
 b0RE/87c8DkrPAJAIbEK8A04866rbTnwoxvzZ+sQqP98dc877pQmSR2R5wmfyobDvAQ3nFxZ27i
 BdNQf6epo7AQhsW5zV/ZBXZ7opl8tJk81C3MOK1yf9e03DIShDZD1dnGJ1WzqznwcYffBFb0L4T
 8IlHMOja+BqPwogFXhqfkKthQC1H0/kXEe+fSZd8IisYZ2b1IAO2TcHOKQD2e+Twp0gpzUw3CfW
 Fi59lnpt6dOnFsBY7E47/9MGFi9mDB1jtxucAv4XD1p9bZaZuu8/raj7CZy7t4qgtsT4g0ljCz9
 36+GpSvPUzYyHqbflmXP93dRFOQCtklbcbPjezokMfA0Up+eGp93flyogj4x8bU16ux0F7xm98a
 aQMZUtuJcIUl4GMgHjSg4zM4qK/HysK/Zmi53gsxiaL58ER3VX/5cMEKvjZU5bo2irtA9I42ixi
 gipGDUvp0/1VzjJ9uoQ==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58a1eb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3miq8Qb-Iyz2LYAwW2cA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 46FTlwBk-jnV711p54XjGSN7IvRI8izg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160095

On Thu, Jul 16, 2026 at 04:33:13PM +0800, Shawn Guo wrote:
> Qualcomm UFS controller found on SoCs SA8255P/SA8797P has a MCQ I/O
> address space. It should be defined in the bindings even though Linux
> driver currently doesn't utilize it. Fix the binding before it gets
> adopted by DTS.
> 
> Fixes: e2725ed2a7fb ("scsi: ufs: dt-bindings: Document bindings for SA8255P UFS Host Controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml    | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> index db165a235cb6..bc8734e1fdea 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml
> @@ -16,9 +16,15 @@ properties:
>        - items:
>            - const: qcom,sa8797p-ufshc
>            - const: qcom,sa8255p-ufshc
> -

Damn! This newline shouldn't be touched. Will fix.

Shawn

>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: std
> +      - const: mcq
>  
>    interrupts:
>      maxItems: 1
> -- 
> 2.43.0
> 
