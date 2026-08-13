Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA445484256
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635504; cv=none; b=r93OLJDqtS1hcE+P2uHoh1gRf08GJopbkKG7yovoNcKCqmFc67mv2Wx4NnbLG2NDhlEj0nSnpzKD749bZsGMU06dMg09kaZN015MvZM3qh0TyuGhiv4MwDMgxFRUFcfPL9Aj+cI4Ej9ZrukasHMSu5XkH3Qv7R8KQ9G7oHMRaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635504; c=relaxed/simple;
	bh=+UccSeJlO0loZSK/eH8DMP1/5s7t4faZKMDsRTcReC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ADelF1/cD1Au1hspv/f2CYqw1nt7zYoJ2QSgIrTooRutTl+PBLj9dpT/GvY/SdMOGPe5ft6GA+DcTY4uUfSSscC+O/eaWCeabjZn+HrHrQTBJgxiod5sECbJRkN+ag6xqTYrUqh0vkv8IpU0WYyOB9XWviAa8kF84OTmrqbjCYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+aYcNPp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KvB0nQtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+aYcNPp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KvB0nQtV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFTQEH084524
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2Z+8TPPRz/0BEaS0dGmL/mci
	2zflTsU1Bc4aBxXGWSE=; b=g+aYcNPpxIWs/oJJ0iCejJakXeLzxdBdRG12jvMh
	argp1tvJHacVB5XZz3z5BLhlTizXR2vhaqycVmwEPP9Waogv4QuVA5csDPJpPLYx
	PIafcPe5N0WFyCLqROGpo1/NZ6MCmI3LJ03mxcxvj3lox5vOQXdBvnQcTTBPM8Bl
	a+FZoL+NsdoH3gxuv/uhMGCG+82Zo7nJs5nInVwTTrJ94rP6fkAZ/021CMu0l5Pz
	MJ9GHQvRTMsKCdamXCqkZ/fmqYYYDrvQfRlcnr2EVPR+MrDWm897sCQa1ULNI1AI
	8fCtJtkbmXoGOSmT9M4QnxQFFTgvbV30H4/t4KKv1vdOag==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g152mb5vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 15:38:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d33c89a29so816621cf.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786635492; x=1787240292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=KvB0nQtVg4pO9gyXeYStZgsL8bGgNaaz3saz3woGS/RezwCthOfrdw+sU1HHEb+KLn
         9iLVl+K35aFVk1YTSM5o4MpxsZ2PIS29Cx6BfMN26N0B9auYJ3qEzFqBs7tKJIcTOQTv
         xds76EfzjBFMONPCLgN+DJat/e35tgTGj8peD0SC/P9SGvxWsxpzYufDwbGQgtwkG3AC
         o3h4WZ9Lf36Nabm5E6JzpZE+L8HxbHi47Yc5d6rObBa4mbBO1jHi2UFnX6lzqki1IKgQ
         MEBmFY+UXVQu2VZQRuuAxGI/f5DPqDLX4JXduweMVtCu7DJ5l8oIhtYea9PlY7LzjN4/
         SY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786635492; x=1787240292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Z+8TPPRz/0BEaS0dGmL/mci2zflTsU1Bc4aBxXGWSE=;
        b=kfptsxmbVRYPL+MSaiEoV6FBrOMmgvq25OiJeAyScBiFibPiQmlUNjswP3wGSQgwr7
         LBOX8ELt5LM+gfsHum4dyt5ovy2U+aej+RkwCfcFF34jvug829mopJdGzdYrzgSI8iFs
         8wO4cmBZLsj9uhaWF3nZ2fxLPHfuTLDL121Q41bVBqRCRQfdwuI8eumGbT8QEalgYq+m
         EDSrOYEh7SYbJ93o5HKijbk7oBn25muhDkYk58rjNqPldNBNEAMjq6C8uONKFOey4OJ8
         0baf3CvTWt8VBLeN+LSv6y9NiNUf04INq1SFAFwkggmckuZqfUn6raAcVPSfRzeOi+r+
         5xtA==
X-Forwarded-Encrypted: i=1; AHgh+RpnEFz4mnpQvxPGip+XOeslNlXoQ8s8ggkLF+IaSUNpU2WkWSQpJxwTcGIBRQ1k/TKN8A/u2y6XLJCF@vger.kernel.org
X-Gm-Message-State: AOJu0YwG8u0AlohIsJnF3qmiNgr3VlOJkXIEr2wDoii4U2SYVlFJRj6x
	4qsTezu5fg/AD8IIC2hlepH61D4enr73rzoxNAn3SedzYQ35O9qaiqdfPNV5mI5b6NgESn8ROEw
	GTMG0cCv7V8nNARYWpUEHQb++llKSo0QUlOla2DJyIH4sgCkQOH6XHzjFno/o7akg
X-Gm-Gg: AR+sD12kNytQgfiQ0eIQgzlgCEHZDuE/Qiioam6b5rV24yleZRRRZZUfWty6cgxPxAr
	aTELtvgdLSALZenhjfq5VIoodEgD0lOIMFw+tvjcP6lR9/nZeJg+nKrR9Zmkrsndi6OQrg2viDC
	teBe3zVCnlG7Yi0cg3a+nV9HUl9NaeWmsMFwFQDLYFrjhibfyQpd7onfwPyIBRvU1+W00aWsmq/
	ImMNk1g+Y3AHawxkWUQrNZUFSDfnSWwmoSpaS0GHQLEN6CBtheWDbLkkaqT8mshW3w8xES9hFtd
	pzka0W1ZpnFwkONDz6ITNv6DVRRIjZDYptCMeQmYV+JPXkOfgB5IpLRrEMPqv0xx/TE6yAdI0mD
	025i2PR9TsaDGDDrw1J/AJrbK5U+DuTj5RMkzvbNx35BqGw0OMWspRuzcvAuSKu6ox8DYVwi5H+
	hSpP+KWg5nJVKe
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63315351cf.4.1786635492110;
        Thu, 13 Aug 2026 08:38:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1106:b0:528:15e:d1d4 with SMTP id d75a77b69052e-52d73be0ed5mr63314781cf.4.1786635491629;
        Thu, 13 Aug 2026 08:38:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458419613sm64708e87.62.2026.08.13.08.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 08:38:10 -0700 (PDT)
Date: Thu, 13 Aug 2026 18:38:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 08/14] arm64: dts: qcom: ipq5332: Add clocks required
 for USB3 support
Message-ID: <5dh3s4dbpynj3tbe5ivmsq5qjnjztmzpmbj2m5whmi43qlae5a@w6flmrikrked>
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-ipq5018-usb3-v2-8-8f355d7ff0ef@outlook.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX9DMRAqtUnjx3
 NdSAUZrOiY4eoI7GG4/6m8uEVH4QzAj7XBjmL8DFbtwX6ruJihJfEuw2x8AkUJUi3Qhh6/s5jqv
 JW50qs+XqRx+6WhjBPKgphdd4DaLUQg=
X-Proofpoint-GUID: U_KT5zz78oYElhJanMsxkkuCG1esbJCl
X-Authority-Analysis: v=2.4 cv=D8R37PRj c=1 sm=1 tr=0 ts=6a7de4e5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=TbTMhDWFNTfgXYAo_YsA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExMiBTYWx0ZWRfX2L+4gdEqMVbL
 JfQCdWtZ5qjWp0PC3baLJGCnNcoM9Kr0sTwh88UohGPL+pt0R9YGnzh9lzwpdjijfT9CA5Vyeh2
 Ckvgb5/eXYruIqm0QBHiMaTgmVgFWllXWW+6vERMYxLw29Y+sic9XvtZy0YbqW4lTyBvOXt7UWG
 HNMDah8WBh399jv0W4gojKjSuVxaegEDJ/fC4HBtcfh7pDWvINTtewOOfxs3VoyFfNz12H2SOUB
 UYxg5v/adwbJXQK3x416EtHimzBN6Xx1NJ6dc+6e8kjZUMoi1MKHZGuQD6drexb1m3VGW3e95wc
 uQNHu89I1nzCgsGP+xDPIJq356+nl32kdVmqfadDQhFCfRk0wNvEbqLu8Nj9hbXTYFDvV2e8Ex/
 9PWIGawopBRsbG+j1UT6WbNJXYd4jcjiwoB00UPm9PryaqI8PzZ6eizIboEYkfgw7YXteOfSwnl
 JFJi2CXYkrDeH+8Kq/w==
X-Proofpoint-ORIG-GUID: U_KT5zz78oYElhJanMsxkkuCG1esbJCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608130112

On Wed, Aug 12, 2026 at 01:34:43PM +0400, George Moussalem wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add aux and lfps clocks to USB controller node for Super-Speed support.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5332.dtsi | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
