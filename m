Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A2388E72
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163149; cv=none; b=IjHPA/HF8N63wraub6wA6syttgRoTdpbxD/L+ntlX7O98Mr4ldbW8laDuR88fnRlJ5afdrgkf7uoitrL0/nArmg1RqT3f4YrTRkZRk2QfagKc8+S4fZEYe9P5CN/5LsGxaajJGTfYPTv/XK/HkTpOxj6j8Y3p2PyznWNl/Pnmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163149; c=relaxed/simple;
	bh=F8UZqBiRjwCdTWFQcl7GXd0FSpEqrKDObTlRUXLiWvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2rvyYT3ehdYEWqVY3WfTCeHYWNiax0qSfPlvpY6rD0V6y/GA2/suaj0F6g6zfUsOAKC1yNl2nmruuOzAVZqoELvFQJh1WBFSaPLzysWsGTsrWVpWLxyQblwf+j/jC0DzNaoLdxsW8LxhtNkUyfHEdas7EgmKWEQnqi0mXWJrmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AWwmAoRU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtMw8gwJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWwmAoRU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtMw8gwJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaZH3414011
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fz+eyPs+lXUU9m+3Ww1RsEM6
	yEKfds4RuaT0czVXZ08=; b=AWwmAoRUL4MB485xWnv6qkhVQmhSoQ7KayOKbVmg
	Pi0H25rzQw24MZs+vgfuv/y66mRbrYKnAvtD6b1nsBYYmZlLk0vIvLqOzxq+J4Er
	VkAj+kbCe++goNPcMJZKPbRUqHaHX69BaDYlOhs7WLZOij/ojVqwInjFhuKBGU3R
	dINX0cDFXKC9GMm++MPJwwKvLA2oPXQdJJuL4pbasnIUFPUWCJkNgnZz6dAOLkoe
	KjNfndYxqbZia2ULTPDGqnHG787YqJbgoJkJFGcrMOBrch+bNIUJ/B4oaa4HgQaD
	YqGECDVk8qDyxYr6NCknd7/m0InSO5yqje+GdHFkoi5c9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v694dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:39:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so30210511cf.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 07:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163145; x=1785767945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fz+eyPs+lXUU9m+3Ww1RsEM6yEKfds4RuaT0czVXZ08=;
        b=QtMw8gwJDbGziABQYt2oHOLyvaiL0/Rn1c8UvOd6JiSQABHoIqjzHNAUkrdGV8r3aq
         lOpkadgxOxPAvHifX414QCA6ZNXiI73UBZcCo75d3TNIYZYnAbDilxPmoJhyu4VaAXpP
         P4FnzN2MjjCrVo9puXZKQ2JVZT3asC0FV7vwQCwzsnRrwrJtxbyzPwCXwA4M+J6nN38E
         UdCp/8uNxVnUIHlTVfttLVNfzo+FV2Z29G8z4GjsKJvphaQ4StjRzx15EBXZg/VmYUvP
         kaMgsXjZ3AhBYhg9JuQr9jk10JITSgsyim/KU7qtA4NMJr9Q2wTxLEZ+NSAphL403S2g
         BhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163145; x=1785767945;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fz+eyPs+lXUU9m+3Ww1RsEM6yEKfds4RuaT0czVXZ08=;
        b=QB7t7HdK4KAmGCy9s47k1qbJ3s8rWqVX1B9YhJn6mMSZ1NP3mKM5sDjFtKJFtODNrQ
         Y3PbNgaWx9KKwwd4G9yDGpC0chaS6zlS4ZQhHax3e8GeGWX3DSn6nx/A6wxQUr2PncEU
         qkRIYmqGjoeogWytvRGBq6lxXoqkj5Q8yulY2+xl2dmpyiKstoII6iWRhmpCnwYcacWt
         ll+VwSFGY4GpvHFTjVtKL728YZ7LgV204+3qMxHrpmQofAVuzd7Y5VQU5Ln65C5Ha1k3
         MgM+EMoyNuON1DfIj7YTDixAGD3XMJpHQlnMcpCWN7ExvMFjAWRgLJaLs8z0C+GIGmDv
         UqjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLue0fm31c6vOHPhFOf1omOe/q/YRjTDFvN/epqKR4BGW7oD3JnzeqfLBDKoDrSten6fGF5sAxj4zX@vger.kernel.org
X-Gm-Message-State: AOJu0Yze0c+o+5RAdxKFmrJa4AaZ3aPhxfCxdBYf3pX6TMeK47XYEFxI
	PozJffDDekyjJHoXrNOtdP8Wfo8CSjW0souOANv/1UVXZpN1sbrErVsE9ObKDMy2qWK2okhOmEf
	zNkDDokWiA8M8HBGAeRCvW59J5jxVP7x6f+uBSOjnLTquoQfnzoq/O+W3Fw/IkH0a
X-Gm-Gg: AR+sD11YHXPfgQiW8QrjXSR5j1LuvOKj5NesZKOii0dKU/Nmdh3k2ZsqYNhCRWoPSQ0
	kqE8/4Jlx+iKhYXe6GnwR+Nc9ifwSQoeVWIWwDczBPaUkfwTLs9rnDVNsTAB91M/r3UpcCqcBGt
	9waYlfkWm2zQ0aseCud+DAzxcH7o6pdyB4s+LW9IxL8UZYTfA/O8LGoHHAPF+HwfGiR/jdEh/MR
	gD1aWvzNy/1OA5EEhADEvhXSOIBNAmlSZ8P6CCLcN6jqpiOpYSJmAjm1E07MT8ZL4jqxVuATLyV
	CUUrx1rDMj6YwrVFWzyhxiUfWMN1Ho7rVptRz6Hqlv1laefmbapXeiEbM9Q88ctFSzEn64no4Of
	DNnUBoEJtYAokfeszaAlwgfEaIC/6M4qqjTODfVAbJmYvfNqjiczjJVSqXD500589DiMbD2T0tT
	Pun+MZzWjDtc8yxw==
X-Received: by 2002:a05:622a:428c:b0:51c:1117:c6a with SMTP id d75a77b69052e-529a838257cmr90507881cf.4.1785163144898;
        Mon, 27 Jul 2026 07:39:04 -0700 (PDT)
X-Received: by 2002:a05:622a:428c:b0:51c:1117:c6a with SMTP id d75a77b69052e-529a838257cmr90507521cf.4.1785163144477;
        Mon, 27 Jul 2026 07:39:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f2224cadbsm14054201fa.28.2026.07.27.07.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:39:03 -0700 (PDT)
Date: Mon, 27 Jul 2026 17:39:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Message-ID: <frtf2ihyfxmphkqtrldydkmdh7dnetzbqvyyi6cmopuoyqwkxb@hco3epyrhjjr>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
 <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX/ltAbM/DtR+v
 DliwuhPWcYZ1tbY2TjoqVU3IC1NsthznSDVw/VtKqbgmyKWDnksY4t86/z32N53z8J9qBkWRjVn
 QtQklDqJc2f21uPdOjeIOANb+NEjF9Y=
X-Proofpoint-GUID: jkTXml_9CEbtRBoBLmw_yHcxjOEeGcZ0
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a676d89 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Onw8or0El9vTDhKMn44A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jkTXml_9CEbtRBoBLmw_yHcxjOEeGcZ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOCBTYWx0ZWRfX1OrlBXsXF2/U
 GuGKV3//uYBxJaG/rs3w/SWOI6FAKmeEjP8gK3NxnyabNDK4Mlh4QTKRsSTvYkpgM3Fzw1PT3FF
 ruLwqwFvYbK+B0gfnTqpOkZ/tzUFg9vWU81PKxMAipigmv5LBkdldaGi37mS0mzkeIFddEzRe+R
 IVLDE0/B760xjYHPt80U6t2Lx3dYKntCUvlYE5/OKHl/woKCIndiAy1WW6s6OsEot/ZZqLcXMrZ
 RBp6j+bM33o+Oo8uEWr63Y+nvDsqhiev9DdQ1QAHnXNuEshqPQ/tPo1z7lqlKCkEJ9YkZt51N9/
 IUX9LxvydkdKo7q1UrezcC0MSlgcIoC8BrxyK1rOv2VKRq2juokc0d2fASuI0WiVLJtmJ3l9B6b
 3AsT1nX7l75owGmnTqhTlT16yuK5q5oWlhSCcCjeOQG7NdWQKb8URP8+m5P68I5Me73Tq0sKbfU
 TceU2qkgbeau8Yq4UIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270138

On Mon, Jul 27, 2026 at 07:46:32PM +0530, Wei Deng wrote:
> The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
> wireless connectivity cards over PCIe and UART interfaces. Hence,
> describe the connector node and link it with the PCIe 0 Root Port and
> UART2 nodes through graph port/endpoint.
> 
> The M.2 Key E connector is powered by a 3.3V fixed regulator
> (vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
> (vreg_dcin_12v). Both regulators are always-on and are required by the
> pcie-m2-e-connector binding.
> 
> Also add the serial1 = &uart2 alias, which is required for the
> Bluetooth serdev device to be enumerated on the UART2 interface.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-evk.dts | 73 +++++++++++++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
