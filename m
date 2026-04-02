Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4763D3D1E
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 22:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775169864; cv=none; b=RNcXe/j8cOOQcR0Jdtqt0QKufI8DEdrYMG9d8GK0orjdqyp0bHBJfrvJx5/BpX9mGkRbg+oM6AstWdvFiswKBMGwLXa/hil7wgqeHyjm7y0mjNgVVCVmdfC18f95fVVUWRfPJ1jLXtNpYV1/FdRgkQUZnXkd4qeqjepVhXIFEHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775169864; c=relaxed/simple;
	bh=z2S0O+Z6SKjDTzHmNBzLfCiFcj/fjoPQu0kmvFQE9mQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY3rU7797ED3We4PqwkW9Ri57PoW+/Orh/w6m8/1uDxd8zDAQ7xWmuBdzjz/Dt3lEt1ohnfFOF02SS/tuanshjgT+MSIb48Rb85qXaqQkeZeQfwQ33eUMcpuU4Kx9yaHZmZUeS1dxX9xkU7zqTWy7KWT87rWW73lEYwXjn22w0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CZqA4XKt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/UEqsj/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CZqA4XKt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/UEqsj/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632G4lRY2528189
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 22:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=; b=CZqA4XKt5yhWCJ4J
	psylQCzfLI6KnBTytFRESmxSBv5qf3fyao5e1/MBTsTIujIbrhhFd5d1jyHCEQOf
	SBLJJjTu5haDqu0nWpqDO/FEiGJ3n6FnjGIv8TJE0CndxXGAmlTY5kt493jfcae5
	fKZb2rC+i3vgHQbggTM1hCAq6cC3rddGnd44LUMjFN8wgZNXVPh/rolI1qSSVZOb
	2bgIfCDqc3UL7DYIotLw9MZQQO1T+7g8lxVcvklMSfT6UVhVtGFUBlZKUni+cH7W
	1t9Ii5gsiqpKCM9r8m6IGIT/qKpNYol2NKT6Zozty9xTASY2Tp9hR4FBaSiaFZKB
	ctYIKA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9txc9du8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 22:44:20 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so1784685eec.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 15:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775169859; x=1775774659; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=;
        b=H/UEqsj/Q3CTMJtmlEdZ83svffwVo1C6IRvu2i7RNsDq94BbabBOsKwcATZV6Pm/AG
         rWjOCJp/qHW21/BOEZVpCX3nmzg+DzLRmOz77j1LqR5gNvYaPJv5zLqFdFXDcBs7oC/T
         VQRQqqQK2nnWWRsnGvLocTBH07haxuHV22pnhx2jueFhfiOjOGpypurhxSpeSJZQAgno
         XyIbwNCmYtvz/JmCw13xtRL9Tx0NGo5PbA2NVYhlglTzg7UmsYsaZPFJIHw+KPCtvfzM
         VwXCScoK1z0xMG5Ejw7FjBWy8lMFZ4PmmDOiVynMAp9LTXRbPkB0sEt6XDyfLqktfBsH
         T/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775169859; x=1775774659;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6UFKNSmLGChWbcHC+BOvNrJhyweshXNps/7M9u5hOUM=;
        b=fiqB4npxGUol0EtKf5PxmZZuRzJQqlK2vSg/lURQy3lCUJRt/Jd5FfreBhEN+WqSpp
         OOiKlcCUGntJIbAMdrpS3QWewzxFz4VmoHe2u4gsyqaHYgqHl6f/9Fatfm+Owq0YQhQT
         1J0Jwwa8bYFsC5lScy8sE9cvYfMBPr/Ze+HGuOej/FRQBQ8qlsFW6zI1uQky+7fl/hgv
         dgOvKgFOCE74uCEVS1RXjctwNUo6bW7I1uejZazstd6PebwbuecuUEkRj4qvxvA83F+Y
         RWdW63+75cAjZpJ/fF9UUWjWNfbztxdsU3PFZ6fC2zwKTgIIp+oHwHAzXWdym86KfLKK
         lviQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj0LhL4pXJFgKSNEMnnLxxNd9KwNqDTg0VP5QPjzGtrfIbsuj5cW8MdBjS/NK7j2vtRcKnwIzxFmOH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywecyfk2qhNz3Lg5NFsIXDmKUyNv1JbPU33JUWzocsg01I9S13d
	TxPMUk/NthafC2UeCnNnda/sfWl3HZW2ay0pbFEFzLcdD6W56Fx/shW76GFOEpB4SSKJL+vLN0m
	QK9XyTF6lkoaxxO6I5TBObF5kYJ0OkdNecQkGmzSOyYHJuXG337KBq8MH5Q1bOWU=
X-Gm-Gg: AeBDiev5AKAYdhR+ceeYTKeaQmEJcwuSTwtjW25qehIKbwVpuq8Ltu7jYxhJeRPsNkd
	wjhZ7bACkneZpk3e0I7+Fy+kjKb2iKyn3OSZjf4rktWUfz0pryTnsHYorSavzW+si1OfNb+f4wp
	Bm3v9zdlrxRhvv4tW0vfrEJfrNDdOY6tqrjFRFn+ONxN8BGnHmg41XNIJ7UZhtal42y4D+7Yvz1
	ZQlEGxDFOwKjyC0AhITyw/VrkUOlrO/xCIva1NC7pr+PyJd0mHFnRx0rKFaOejQYtFQugjfxHE6
	XJvwhuBIHP3ocY7kJLJBm4o1HawTiPx7T0kLeqvq4EK1Y0t0STpT5KwYAoDFre/86jfi1KDKHhY
	xAoNipPC4eRYun7tdt0R/Sfb860Aqe7FUOrWa/LymTLl1hpS/X14WWKpDGbsgXDnQ1EwWC9+Vuw
	==
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr507952eec.3.1775169859342;
        Thu, 02 Apr 2026 15:44:19 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2cbf9503894mr507940eec.3.1775169858727;
        Thu, 02 Apr 2026 15:44:18 -0700 (PDT)
Received: from hu-fruiz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cba62d7590sm1943062eec.24.2026.04.02.15.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 15:44:18 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:44:16 -0700
From: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Rob Herring <robh@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: cache: qcom,llcc: Document Hawi and
 future SoCs
Message-ID: <20260402224416.uia466lzbgef77oz@hu-fruiz-lv.qualcomm.com>
References: <20260401-external_llcc_changes2set-v1-0-97645ede9f6a@oss.qualcomm.com>
 <20260401-external_llcc_changes2set-v1-1-97645ede9f6a@oss.qualcomm.com>
 <20260402-dynamic-axolotl-of-tempest-eeeb7c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402-dynamic-axolotl-of-tempest-eeeb7c@quoll>
X-Proofpoint-GUID: ho4_nqwaEJ3h4QzzPs347IEuxI9QWe_E
X-Proofpoint-ORIG-GUID: ho4_nqwaEJ3h4QzzPs347IEuxI9QWe_E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDIwMiBTYWx0ZWRfX0zOH+thhKO1z
 +PFn4xrQYVG5ebAFRDm3Y2mNCZdEcgzRJTYSNYqjMylAJlvi3N76LS9Wq1p0IaiYiwnI0iCMBfs
 0NwnydpyurEtbedaZ2tAegVxzlr7yDGHWNF3hGOAlZBGm4XrGEOcUNDKta4mk0alCH5SGGOPk3k
 hLyeuwIiTtPB+et/uLSV2AimihIJM9aEs04Dl2IfsQLVZ+awWysMLCohdjruOLrK9RvB7rHy3xt
 V/984iMucXnWiviZj7NlRIBiPvBeNe5qnXwq6imV+kFiH/0nRSNc8HtAqDMD6Leb1iIY6pJw8qw
 /ZQWoDyyCJ6jLU5EYt/LGEHfAjRkvGntFd5Kije2BMD51GMVDluTA9SaYZOwnc/TWa4czpFWR9y
 BjpCfbcULrmSusYLm5BZlkmn16dzMGyrh96Ipb7DXxP5AmtuCDdNIn2w4ev0tokWXXP8MvvkfyK
 jylS+B99TZtyJfdtQeg==
X-Authority-Analysis: v=2.4 cv=HKXO14tv c=1 sm=1 tr=0 ts=69cef144 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WGe_n8jcfaY_jPX_giEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_04,2026-04-02_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020202

On Thu, Apr 02, 2026 at 11:19:42AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 01, 2026 at 08:01:34PM -0700, Francisco Munoz Ruiz wrote:
> > Add documentation for the Last Level Cache Controller (LLCC) bindings to
> > support Hawi and upcoming Qualcomm SoCs where the System Cache Table (SCT)
> > is programmed by firmware outside of Linux.
> > 
> > Introduce a property that specifies the base address of the shared memory
> > region from which the driver should read SCT descriptors provided by
> > firmware.
> 
> Subject - I do not see any future SoCs in the binding. Which future SoCs
> are you documenting here?
> 
You're right.
The "future SoCs" wording is not justified by what is currently
documented. I'll drop that wording.
> > 
> > Signed-off-by: Francisco Munoz Ruiz <francisco.ruiz@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/cache/qcom,llcc.yaml       | 29 ++++++++++++++++++----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > index 995d57815781..ca1313de10ca 100644
> > --- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > +++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
> > @@ -11,16 +11,17 @@ maintainers:
> >  
> >  description: |
> >    LLCC (Last Level Cache Controller) provides last level of cache memory in SoC,
> > -  that can be shared by multiple clients. Clients here are different cores in the
> > -  SoC, the idea is to minimize the local caches at the clients and migrate to
> > -  common pool of memory. Cache memory is divided into partitions called slices
> > -  which are assigned to clients. Clients can query the slice details, activate
> > -  and deactivate them.
> > +  that can be shared by multiple clients. Clients here are different cores in
> > +  the SoC. The idea is to minimize the local caches at the clients and migrate
> > +  to a common pool of memory. Cache memory is divided into partitions called
> > +  slices which are assigned to clients. Clients can query the slice details,
> > +  activate and deactivate them.
> 
> I don't get why you are changing this. I read it and still cannot find
> the difference.
> 
> Introducing irrelevant changes only obfuscates the work you are doing
> here.
> 
> Best regards,
> Krzysztof
> 
Agreed — The description change is unnecessary.
I'll fix both in a V2 of the series once more feedback is collected.

Thank you,
Francisco.

