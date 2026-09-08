Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1159372EED
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851865; cv=none; b=L5aKnwKrVoWtzkBSHGCboOPOYCherfhcSf9kO1gAGM/zHd8nCNWMOYBIc+6P/F05sdZQ+afEt4OJc/Q6fKO0QbH6k8S8uaXzXchp0suuQBiN29a2aFNLayzG+gf9SfuGaPcvg8xG9lcTEYosB51QsKezFCX0Q5qBw4Rdj0nCfGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851865; c=relaxed/simple;
	bh=yA3DkIG9wLceIzqY5pH906S7W2EOQlbooZi/3IyjZXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RG4hEUeFBdayzW4papxgcfXV0z9Y3enmg6CZ3euMiR49704HuprHZqdJ1VEyXB7J3mWQJJZwdHWlPPrRXGH1ECcP5dwRHcJ1kviHBsf5BzTxNU1TMJtQJO4ZsgWHUd6pJuAz9mflAJzYFnENhmjYZMHJwo+hhmHZql6VrOA4b+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WuZpxWIP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZv+WTGy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WuZpxWIP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZv+WTGy"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1St2712349
	for <devicetree@vger.kernel.org>; Tue, 8 Sep 2026 07:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ubwlFPq4WID6HMwM3Ww8q+VA
	AJmdhFmvzLLU9Ua8Nbk=; b=WuZpxWIP6PoxyE1KUVgXObHpT9XBFF+wz1A1tLRn
	Kawaj8rwBvZfQlXvjeh8u+I3UM7kzEjSlgaPtvzgC7RcUoSVVkoUKJTDThSwD2Zf
	11Q3ZYG/83/CsQuLJun39FaCEgSW9j0dQrLLQ5XWt4Fu7eWMkI3r+6Tw902Jlx9B
	gRQhlIm8fVfUP4EYUTxLdqd0Ug+p6mWOmWo6d4Lc7uKPq32J3+RZDETfTt/+C+lR
	kqiroop2AZIv+2WxbgGCiyypIpe+CtbelP6M61PBkcRaPjpSzvEAyWSnyaHY+4E3
	z7ZT89TGZHNKl6Pdsg9XvyJ1EN8LyrhgBHJMAN1/ICBAUA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqm0bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 07:17:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so48197966d6.1
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 00:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788851862; x=1789456662; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ubwlFPq4WID6HMwM3Ww8q+VAAJmdhFmvzLLU9Ua8Nbk=;
        b=jZv+WTGy4vEA+cRhe8UreZwnqOs60j6/YsSN2C38g9vBIHG7ynt+XXLSGS4T25Qf6h
         OEHa/s+gQpVh28HgRxQGJAN35YMeOpeWhaTxOCfLY0vC8/wHRXWSbRxRvNgpkM0HYecX
         TUS6NHYt3amL8/IlNlKq8LfE4V/3PHWVYUIaYIMUF1eihIi+vohnCd86bkVkqfYdErMJ
         g9QLEMgS2U+JNvaUxZnXB93dlb4yMtGtacpg8WkKrsa2u/4Uk8IyRMHwQiP1InV5uZb+
         F0sQtCcYsbGIQnPbqxwUgGDbSu1WqTJjtjH7nqI/rLgQDZtGw8ncJcr4R53DMSp8Ikkr
         prKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788851862; x=1789456662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubwlFPq4WID6HMwM3Ww8q+VAAJmdhFmvzLLU9Ua8Nbk=;
        b=fQN1oXP/LspkExHwQOwYszAqDLfHc16YgkjuECys6kt32fOYbbkgI9L3gpBzeicn6c
         29o/53LQ7U8R0XVmGufOOJkjiMa0zrQuK/PSZ7gXFJpwhSLsbY/2TcW8J3nf8XWAjCjY
         i1RCnDukPfFP0LORvpDHBJRC2HRL6dQenpF/qChri+SonRAgdW620QHHHDWA/FUI3nfB
         TvK6CLnyWFPO/q+6ZqFdCMcUud6Dw71h+33WMazHTUC7VHZdP7/9rdc/3dohk0jveqhL
         53T0aOujYWWDEACWvQEave2o3gtlu2DDT1UKj6kXfe/GdKRSQHv/1X6H5X7weYsM5mJq
         mxFA==
X-Forwarded-Encrypted: i=1; AKwUvBz0IbtJHzU4s/ojlfQMibYgB9lQP+rV2UGt8T6Sm35CM38E1023m+njGcUiETtqgKqWQAY6Bx2kBSpS@vger.kernel.org
X-Gm-Message-State: AFuF++mRI3G1g078H5CWDcC4VSDKp0kM/JkDonvOX1Rhzoq+sr+V+//7
	KfyfWAHq9hcSBzI/NTnB1SuUJ0rDxgP5xuYVG4u0jUYXO2ZXVyhNxainCecRnyTU6yXA2jQCZUw
	KWNUyaPMKblSvh7jHf0jMctwdw2KeeIc3+woIdDEu85I0Z5vh3SYJXZfySMpxQ/74
X-Gm-Gg: AYBFou132x+VBf0DVtDfAB327daAq9yopIiQuDQ31du6uV4mVYsbSrDqni4ze74tJBi
	ofyQJ10QsWl+ZHjICe8m7QxT/YCXjDglodNFe/0J/4psWEy5fRwGLrJgU9p43TJo13itrhAgZ44
	5ZzMUivNAWi9MLQCYCzkviTiYPioDo1Jh0r0i84FZIoqgQ3K5zG+oRIBOiNCZ8geq9iJFhWWjtF
	T8Blq/EME8gE453hOszsvLMXM+Kw4T/N49ZOl8QzRfkaf8LGsBjaRstPweL0vJnmTjtS5OZSdU6
	HARWCUHlW9mrfyupkIFarOVsMh9K7TXR9hbv1QgPEKOwBadRpft313NH/e+pRTlLp17ZUuyQM7d
	iITHiwEQrWQY=
X-Received: by 2002:a05:620a:7017:b0:939:76b9:1d00 with SMTP id af79cd13be357-939802efe0amr2984177585a.9.1788851861942;
        Tue, 08 Sep 2026 00:17:41 -0700 (PDT)
X-Received: by 2002:a05:620a:7017:b0:939:76b9:1d00 with SMTP id af79cd13be357-939802efe0amr2984174685a.9.1788851861424;
        Tue, 08 Sep 2026 00:17:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm949579995e9.0.2026.09.08.00.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:17:40 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:17:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
Message-ID: <g4ql75tuwtzi5iy7z43ee2jcpwfxhqu3cqhcgzodbidyb4h6zw@zm6nqwi3eobs>
References: <20260907-pixel3-camera-v9-0-b1981f2d3291@ixit.cz>
 <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-pixel3-camera-v9-1-b1981f2d3291@ixit.cz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX1FwNYmzQ76Pq
 2n9wmQcBPZeAfDb8hWusJPQZFkqnbnpFp9m28cwpiaLcPiEoV3FOuoJ3BtfsoxbwMhwBgFYFSVE
 iCi+UKz6/BXx6icQbUTQYKQNS0JXNq+JfLjtOf6C8MN6k02XNal9K8VJwUrkY1kxIGjE+9AaCVQ
 amJIMhy3VchIeqFHkb64PB10FamvcGjiyT1X/5c7Ahq82q5t+souQ4PYa5lqYWRHiRVNGHxu6nc
 qA01RJUAtC1xr5FMf1qKHpbyqQ5tQMGW4jUzz0SJL4Q0gIOuB1gGp8rzqq2gxcognxjNysNenod
 Zb3viwPzBUh11YmYz+orwLRBr/L5t/zYJ5UcAXrk/+4ynPmykLXnQA+e8jRbkQ+mw8eWANs6Qdr
 guAyF6CylW/homLC8ZEdPcg+YgZT5KEhQwx20iXSosrsqFpStL7TbRZTAfBzoy742+H4bo5jvfF
 OYnmH04pUQFOyFXYdmQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfXxfeFFScA3Jx/
 y98aHjkhw3Es7/NihQD0GMjALBtehfPtfxnijfJxjQUBZosCKEWwWkUYSxjrmUZd1AGZ6JuxW+3
 glxajGrHKXWvL7AaJKhDaY2/SmEGAnc=
X-Proofpoint-ORIG-GUID: 9Y6LODHYQcyK_tTO2pvRYLtxiz1G8k6n
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fb696 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=uxpBaPyPSpK-buiB_gcA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 9Y6LODHYQcyK_tTO2pvRYLtxiz1G8k6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080074

On 26-09-07 17:58:09, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
