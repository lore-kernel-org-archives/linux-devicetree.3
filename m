Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D973AAF7C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339232; cv=none; b=rpOhdaodbGM3tLix5M32P4YPu19roJPaMPwJlrRBuQHwlrANKeXCux91yUuXOodJcPnsB70hZCIFn3mS/Gsw1YIr6Ws10HVsNlRWTBb062VmS1bTop/El8it8GBPC4HMFIAhVv4JV30m8KrLIZua/J1rTa0D3eA/o/LAkBin398=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339232; c=relaxed/simple;
	bh=qvVc2UIs3ngSUpzRlpZ1gkEZR3fbSXfz0detzuWTJac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fK6rBM75D+NRptjJ3P8fZ+lJN0vxfngeKQm6ihfNXg8u/He7Yy6S8z8Hviwg+m8xmrN21Xr5y8u5S2TyGOLn/wzlGXsvnDIb6sBDP3G0DGPM9Jx8WinvHJTrl2Q9/MLmSfUhroECuNV3kOFGua7tLnlFGkQiiQV3fOfkxyEUbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L7xEEHtj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKp9b4mP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L7xEEHtj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKp9b4mP"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF3HHg2108280
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ajMms+zzZs+uBR5tOwHZNPSy
	MNLyGmo/TMRwS6asBT8=; b=L7xEEHtjD1i38yrf6/u7zQbJ2t12vUPoUyI+nUD6
	ae/s5RMzWNzGK/Nu7UMp4siroDNpWvty9UlKquAo5likeh7ZvPzZAZiSWs3CVe+1
	JngEKgVsq1pIiJC22CrYztdDpsShfG/8KKBWnZDmbodNThQ7re9aYDwNYT/gfPkW
	ZEE5NyGiiyWei9rER889z+bANm1/H5VEBXrZUFWA0v9Nj4oHgJcsDy3KVSHFkD9w
	fMO1O6Vw3G6pKpIGJkQoXl6FqU7urXrOibEaK/RsBhK7aQKKnXLETCFsGbgtlRA8
	vfz2fj2CzT6LYbKf2XhiKwpQPACIw0LHJxx3yyIKksp0Rw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqkds8bmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:33:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0f0a0760so22088921cf.2
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339226; x=1785944026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=UKp9b4mP5lIsV0iqKKi3yLbCtzl3bBtuavIPvBIxXzF6qNgWmSl8ET92wHeuoWYgDI
         cfSnUkZZw97iDOAyvogsmEpzfrF9UCYwvf8XsunLpRpcvcqIfiDULvXW07S+reXNcPCG
         vLdTtp5y44xg0cAB6Qr92wZrp90qCVfWXC1l36G5229x4+Z0SSJ1CbM+QaYW9vb6o7+x
         UZPne1lSD4iYBG7TBhESPCMEO2MIJXaqN7ZDR/J/h97ROMmSTaq+J1qToXdSDhJIi2+e
         JZIt1wD1iXfOZNZJy205EzLIYFmKMnfsYleN+jWvZQM0xi+TGb4pCFjRgbpVKPyXhpIG
         N41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339226; x=1785944026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ajMms+zzZs+uBR5tOwHZNPSyMNLyGmo/TMRwS6asBT8=;
        b=ariQmreqM3m6osVexQhr2pIpdmVQvCnyUeboZLRb2W5S989dsIhYfHvttZ48EONngG
         ybCCD21MxUbSnd5sETg+rATBprGBa+fEjk8HYnOeiaUEryP1bqYDeVTqAStM+kltNxBR
         kKjuprh9aCKRb0VGFQ/7o64yv7d3n8RcwZNQ7054jaZ2XlaNPCuhYJ4Vs5IjI+DOfl7G
         rKq+dkczjLTlTYFjo60k8a5HfXUYMrc5BC5jZzbwV/S/DEO0GKQQ4iD2EP0qfhnSFG+Q
         MQeZ0AqnCfTF0GGJ2B7kyhvG5rfvA1TfBHT4eXWYlqocS7cA36wc7ULXELT2eJmznQAX
         xBKQ==
X-Forwarded-Encrypted: i=1; AHgh+RryIlI4fFTsQ9SPQWSky5NBx+xWapYh2x+3Khjtl4hC6VxJnXk7EGF7h3uFg63Z96CsTWW9TKJNanYX@vger.kernel.org
X-Gm-Message-State: AOJu0YyOIoEO4/0e2QP6g7959c8Yri8yQvVovCEmmbiKjIp+MZMrk3i6
	B3LY21Beube9htJTiFTbUTFlLsnDJ1vI7CARmDUiW25x2HOKgyTNGuUJUFkQXz1YUusSGQQ/6/g
	LKOEui1jvxo4j0Kjk/SfnJh+1K6DI/v34YmRHuFkfsja22iPfkOWs9yVJPxNBnF/o
X-Gm-Gg: AR+sD11aAyrta40Q+SZDYocKHk6ND7FGXwAsK35I2cxVL4lB+qazlSFSyoJJA8jvE1j
	Vxe87xtx0RxzFinaYcBHBJZMriBRVypq1yFvPXByT0p71gy5RghtIfGJ4lIHUM8SyXrmbJfDwzR
	suCwgEQfGGHJQU684MRh4spYmuDDxbK9I070ycxIcc2ZZ6LilEoghMrSwz48Al8LUIlFZfb0mWF
	EmI7IniWUTNvt5O4R7QisY/VZl6brlHHmW5hjUdOegRhglrKMY0FtRr0Izg+46hK5CMHGqcsC8L
	wUpFOPjujQBIYj+G9sIkPVoo1KLwlr+6xfTku3RzyeM+oM9EA7343e2JdwnJMwmgs7VHrBbLNiR
	g1rW8QqCoPkTgMP0=
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69903371cf.23.1785339226350;
        Wed, 29 Jul 2026 08:33:46 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:528:3b83:3483 with SMTP id d75a77b69052e-529d70fc0aemr69902581cf.23.1785339225661;
        Wed, 29 Jul 2026 08:33:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c4615f5fsm156186365e9.9.2026.07.29.08.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:33:44 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:33:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: eliza-mtp: Enable Adreno A722
 GPU
Message-ID: <q6f5b7xejzawn263ipbi7hsqin4c6jqsk6n7h77libdcvaq725@n3jzmra4wgdi>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
 <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-eliza-gpu-v2-9-64379dbebd7a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX6VZCG9QjDY+i
 gjRsWBLO3U8krwWTHj+b9uWnAHNSn6GmWmwJx/3gQ6PXrCElpg/cTkz8IJSyZZKwHyt5y2xNt8d
 6c1Vq3ULvVU8XWwF9Pz578xej8Ha2Ao=
X-Proofpoint-ORIG-GUID: aU5qi4t31i6lRFr1CXsdczQDy7toSjZC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX5/8OQ3tKDM/c
 YYenTdvtUhUWwX9yORxqimSp4e5sVegG5TkxbPkVSc8ZtOGpVGfTyttVTVK8hlti3uw1c4n0TpX
 4P44EmqmnEcxasGv0fjVPaT1ps8vocDIVCr4elhO3yO8c+eyQjsqI4zpkEs+ulSlNp2hIiX/b+r
 etyUn27XkKtR0EMlwpmGzU7zQZ5W0UqAEBiAg8ax0rd5I7DAaAvl7/pdENezcT+C+TRwUXZtwoO
 IokRHobvYPo1SL+r4DZAFoAH89He25UogUZISlwsKnlkXVGHgVolTGl1Un2+SkN2iWBf8KWg5lB
 JBUNShV6PEUyE1ruScQ1d6aaTL2uJvmjvQwb/kk5Asyaa6xSftjf3Tb/y5odDvMTmSlIUMHeTaV
 MjciTkU8zEA9YkqZdiDRf38grJoq/B3antJDZwc6M4du4keUgoTQWBM31ETB09tqe7m83/+SOQy
 zub66DWPYPc/yJxtrCQ==
X-Authority-Analysis: v=2.4 cv=VJTtWdPX c=1 sm=1 tr=0 ts=6a6a1d5b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=2dTW7TWR5CdT-0lf7KkA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: aU5qi4t31i6lRFr1CXsdczQDy7toSjZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125

On 26-07-18 02:11:34, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> 
> Enable the Adreno A722 GPU on the Eliza MTP board and provide the zap
> shader firmware path.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
