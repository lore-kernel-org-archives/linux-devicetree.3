Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2FF24468C
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787721536; cv=none; b=sOCGdqMQ//QSC7gy58QFcJNXHj1bWUfPJcDfMs18s/p0h7AB6X4Xo64HTXNquE4jq2JQmYUSW1gTFuJKob4eNzTG2BCGksryMY7IdYueWD3WEj7TDscLe16jKH2yT3V6qD9Ax2ioxGyQseK2uj5vl4Gs7SZDtBjghIRdO2ZQ+Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787721536; c=relaxed/simple;
	bh=GzDiVyF55rQfHGvleiedGzoAFgokxL+F8Hz4VCr0x4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DT3Qp82Q3DPZkRCtOnI0Xy6wSEgcZgn7tAnbo7sCuM6lK4ek4ak7NSCcUY1ueqdGXUhZ7bArbo15YDmHic4B6UQOppmYNRnYuuOMsar9PfK0dAIEuMNKePZdWfER9mW/Lxo6zn59cpUqa9tZ+GlexLx0gz0tTJrCAkPYzyijzis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coHziAD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COAHMjc1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coHziAD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COAHMjc1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q4beQT3543476
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:18:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RU22bNR4wia9YsIJJDrwCzqt
	sHX3L5zj1xVSrsZMk3Y=; b=coHziAD05Fuyt+Tst/G7RwOBKMX5KAgSwKohCnE5
	aLGtBvfO4nOz/O52aVjsAAQJ8Gdg9W6VN5kxNIhIR5rdhQkIkEy1/IxR3IwF3joG
	MF5qovh+UW8LzBcKWrMAPSMWCYiVjaMFyKKeWzswIbJyJIBkrH6CBn+xkHH0tK4D
	8j8FVHzw0vrX1WUrV2d4rMzYbNpXEXbwHYqfBeAd4CgcK4nmbfPP9TmviUbmplZ6
	wm2263QFwLSdLVhP/PFyQUkZJvi6aXtU6ewZ1P40A4NUgEF6LiaN0blHTvKco0uh
	efWn5piNgsuS4JAUTodAY31ZlMjpN2idSBNLg6j+HQlIAw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g83t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 05:18:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52de05de414so7002991cf.2
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787721533; x=1788326333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RU22bNR4wia9YsIJJDrwCzqtsHX3L5zj1xVSrsZMk3Y=;
        b=COAHMjc1ZNNuqv8pqhM++8bxkvG8YhIW7VGtXDpYf4e2Z6FtAF1OEowaHBImXS0Vb4
         dhFeyoP+11ayW5mmoDTfgUplMZ7Y/wEut4k6vQ6TicBbr+pzp0Q/P//lHDwQrJ3mtRk6
         y+WqMC1l9bOfuuQmpLxGN4xEuxfFwh0yxSxZZxdMl9GMh2ytDNY0bZV+muDUiiNn7sgz
         dU/qsEK6BZrzFcxq3hmRUoRyOi9Zct0darlHfcmCY63Ga6L9B8jBPng65RGx79WbERdV
         hU57ExPIgMtLti7LnGXMKDtTedOOUp42kCBUF6GtUWPnh0BDBQcOTP3Z2vxUvA0Uq5ne
         ygKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787721533; x=1788326333;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RU22bNR4wia9YsIJJDrwCzqtsHX3L5zj1xVSrsZMk3Y=;
        b=NRR50TyjAxjg+ZHgxdoiKX++yfBrcvmxpqZx0KvsRzALI+p6HWtRwnEBeaw6UJ+1CB
         CePJrWj/27dX3AU9/Fk0rvCpRvXBAUTIZba3IsyLLuLDcHS7QFwgVhlxr3Htt3H3JrNd
         0hlo3Ma7FQsC6Hv0qsHzaY4emaIrMC8/rUY2EMLX9WFjg3/XRxbubKQeRAre5TBFGS4b
         oesT/zIDwQnDPGdv7C9kNxDDS+UOSCIyn7tZJPbotOJhPRG2YDOtvUiNKWe5Io/NbY5S
         ZbQnF673He3vimC+FRSq0ShZFmVGOykqcnvJFxd9ablCY1mC8kO0U2q1dpR9Hf/Cj4ct
         OFRg==
X-Forwarded-Encrypted: i=1; AHgh+RpCThkMl7lxpFq7NDGyISKmDLVA5nrEjDWC7usT1sJ6z9EDxcYwL+lzc+ucZz/BQRiPaZXTjHdBwvOI@vger.kernel.org
X-Gm-Message-State: AFuF++l06IHY79i4iMKAn8dL92rXsuvhtpUy7neX69xiACalRgX/fGBU
	7Z2NETaFSE+o9k3P2gS602Sk9XiHBS+k6CNM+GdOQgr4vP+R+Bio8fw2o/wMzDxuaT2++fr3zK0
	bK7GL7pWhI1apuq9qR6cwY1owUxdNHpTjv+KGl0bSbUjP99C/UGlHw8LdSYXYX+C+
X-Gm-Gg: AR+sD12hTpnqYqgwUW917mRESFP2gta7muJD6njDh+GntOv/uarud/t/UJHA6/8g8xL
	4OiijE0MyTGqR9sMjv/37+t+8f6JAHCbbHhvNrOPkJQAvU5UNSwtR/6izWDqrrs0Bb70CDftDcO
	LRPxj37fzCVrbXry/8MD6F9zhL+uedsSKqyofdfO1aULZBmbwuERUQXFHSSql8YZwogLQavwOUe
	QgcZ/NnorsUf83ufWaw+prlm0z9+xFj8YzTraGwj1VWmtLKFeLWYUNpiyDqxgyHK7qkPadAA4Os
	JOoW2fd41yGlWRiwD2VlwdY41J1JwXeX3x71tCxk6YY+VNlWSxgTz9PI1k3+pNGUVMMBOzklcJX
	0BtHmuNDlK3Hv
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr38131431cf.30.1787721533033;
        Tue, 25 Aug 2026 22:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1113:b0:51c:a70:5ed with SMTP id d75a77b69052e-52e42361949mr38131061cf.30.1787721532481;
        Tue, 25 Aug 2026 22:18:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8b6412sm2557081a12.2.2026.08.25.22.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 22:18:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 08:18:49 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v10 1/5] arm64: dts: qcom: glymur: Add PCIe3 PHY and
 PCIe3a controller nodes
Message-ID: <armcwsntigw4grzbeejib2uaiacv2tj7wnbrgiskyrmw6yyfxu@usacdurl3pri>
References: <20260825-glymur_linkmode_0826-v10-0-56ab597d77e4@oss.qualcomm.com>
 <20260825-glymur_linkmode_0826-v10-1-56ab597d77e4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825-glymur_linkmode_0826-v10-1-56ab597d77e4@oss.qualcomm.com>
X-Proofpoint-GUID: PXh7JGR2ZWPP7jmB5uxW5sHmQ3_cm6ZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfXw/6NIn4CEURa
 SsB+mRj/2REb+loyR3SlEcS3mhESUjOTRJAcBEmOTfB9AtgzOKFi0EsGQK2KkcarD9B/qsiDizE
 d+rwCPUA39c3aiCtSxo9fP2gi6XbaSqq9wCaWKAqEGpgV30hZwT3Oo6FqWzP1964mgUlEmQKRJH
 UMJhf2+WVv2Z9ST3DV4+tJYgqRoplCJpxDAaE65DcSRKuQSMuF52laqw/TYxPTtyT9Az2thMr/5
 7TuXedpLCtsP43fqBNJhEHK8f+yMjqVvFm4hAUDWSYyO/TRpmPLJSZ4wqFvTXku5VYplLAdAkfP
 OL3BEYX0UJo/YpaqmpEo0SxQmnJSmQPv3rvz5T6LVt167y1cJrB18I5A1L4Ogc1r4CeJqE994no
 cr+YFUAsms6YLuZxUeSjGnH9VW1AF/PFLB2dwUfgkjf/A9179V8g6/Tqk5W+8yAPZ0T2zzTPzDj
 Q4WTFJL3VGJA66PRfzQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e773d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kF0Kh6n4e_L3U_yLb1EA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MiBTYWx0ZWRfX1Ez+oIn4wGcH
 yRBpYsxJGsFEYXe75w9pjXYSXsslqKdqrN6t86P+GRnKOUZjuq2F6x14WUeHqOD12rPTql1Aap7
 wgwz+HWhEhSOyxPdpxJwMtnhmiswp9I=
X-Proofpoint-ORIG-GUID: PXh7JGR2ZWPP7jmB5uxW5sHmQ3_cm6ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260042

On 26-08-25 19:59:20, Qiang Yu wrote:
> Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
> a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
> two independent x4 links (bifurcated).
> 
> The shared PHY is modelled as a single pcie3_phy provider; each controller
> selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
> PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
> clock outputs instead of the placeholders.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
