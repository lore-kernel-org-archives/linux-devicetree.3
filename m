Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017ED4C6F0F
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 15:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447753; cv=none; b=d+EYGAMjk7QDFWgrSCt8gLgta8+yCGNzRKVhyqKELlLegezFK0NrFSiCi3IRkY89dj3XwPGfoi0Uu7p8h7I3fg4JA3ho1jSXJpe/LE3kzK2FgqRErUBsuVscAqc7NVT6tODtTL0nMMit0HZh2c6x9ZNpblc1FKPdtqFabVM8US8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447753; c=relaxed/simple;
	bh=6OXN9ZSxOHsFSiWwE84thZW4F6t6pwiSkpDKU/qF3l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1pJLegg8c8sqdqQXEBQcTIzRMwk1uVESkfZTdrJICktPl54gEiixsXz0R76T+J9vPFqnhc+s3nBKGqFOx8hld/eNZYmOxyAKyPa2VLO9ExlN7ik9x3wBkceGToOZXF84iYT1aTIoLlMe1nTqIrpFCzzdifSZQbjdGjRfqCtX0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V60kDtss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RiswnK4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V60kDtss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RiswnK4L"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALOf4093601
	for <devicetree@vger.kernel.org>; Thu, 3 Sep 2026 15:02:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OtNsvJ5bduzzTnr9siqKTCYg
	n2DujhWtW1+E2PvYXZg=; b=V60kDtssY7nUG6oGUFHPc07gc7wNiTtxIizC7ZZA
	toTkvrAs8Em/KabPWX9zHKv7HxZf8l1IrqG1eBFyBJVQAEihBt38QmP+WFRvZYEA
	dJbrj+LObAQW75o0vSKveICAw+qfVTn/Gzrr27PCtr2QEfJ4CR0RyQrn5w9zxTo1
	y0aCbjX8GuXpUsrZeWY0gb0cynmL5GDQo2gDvd3E4P5hwFuxL5/YYbmaF3MhTsUy
	f5ATe7yp63kpwkfw+U72eG7WcSLKDGEA5KQdTwJYHZjVUfnnzu79f8dsT0luuo0r
	c35sIeYkGa2JabR5hxdQujqIWJO49n2MCHJ6bGqv5nlUqg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjtqsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 15:02:31 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e98448895so3796241.0
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788447750; x=1789052550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtNsvJ5bduzzTnr9siqKTCYgn2DujhWtW1+E2PvYXZg=;
        b=RiswnK4LmN7RzixLccoJpbknFWSqjfufjFCoUYAP4eh0032uToNslyYVIStgRACJ9K
         S2ZXUXjMt2BigdJgo0Bdk3SsEFtjIsANFVtYBvWSQH5T12w0IE6isI9tWSWxH45S1/5y
         Pc/PQklQwFFNAQugOkZDUaNoGDH4EDVwxXdgHpDp2+rhfxbsWXwnJzlmYxpU4xnbZK1E
         IhMTxHEH7mJWyBRqT0XLohwxucZFClCzTxnBHIUajzGhgaOV6EGgiQPdjmuI5opHpivV
         t1sNPl4jNDlaBMr4L7X+k7y5MwzVq5SYdnn4mp20sHuAjNZvP7/5w5R1Ts55291HXu8L
         RNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447750; x=1789052550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtNsvJ5bduzzTnr9siqKTCYgn2DujhWtW1+E2PvYXZg=;
        b=fUlBTGkhk27hC+RmUNJg0gxvyxXKrbRMPuhZGLxI1cUYtzsTUzGHF84ZuaugT+cVe8
         EyGqh+4U6n2dsLWmBCyYvVcF99UYLEOT6k3b/ezO4LFqqPq9rx2cVV7qYHnOcil2Amc+
         j5inHfPEVVm2GY0DnTz3ebGve6NyNHz11DCN7Q0+4ipvvxgJxBidQWHH3NIW0O3N8uYn
         RgfWU+Npg8EF/ho+ABMd6uVNfgyAEHSFu+oGQQF9KZjS6LZx5UrWmBrFVN5GV6f30nZV
         cqOn3FopBXnyGu2wsYxHubsR/3dXBeXwzn5pnF1dtryqg+NqhtqgI2SUSuUe31vJkQiZ
         rDiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTcuZ9b7Tc9CosRCAMrIaTWUxDhWjPXKtIkN5/CDK1eD3VbmwQphUjrDzQusx+LCIEXFvTnE7P9aef@vger.kernel.org
X-Gm-Message-State: AFuF++lNiW7+kXkS3LttYvSW1bCOk3KKi6B8Vqxd+s+SAatCFzMhWrOl
	t3uga/CNfvSfbBxh4YTJH3e8n8A18gjukM7da8HRq2KLvWQmxZfwXkVg9L+ZwHF31Vvfq0YKdoF
	IPOhRz6p+jvxnKP0uGqIPXUOjC2Bsj27yO1YyE5GZiiKsSo8BZ5txq1ZwZiRmcgIX
X-Gm-Gg: AYBFou20EDAFZr19JET+M4DQ4+N5k818N9BsCNUfcJm+U79ver6uDaGzNehkgQwaoBc
	F0UN0prTWeSuhAJQXqHiwEhfPGuHzWDIwZhXcWWJtJ18VlM0JbFBPmuN+3QSAEPo95JBEW1u0Vp
	TlM+mwRO/HvgBIWyaTpE6MAIl5x80hqLcQ8zWUdy2XpT+guUBT0ACdoji1lhYwY+YRvVUeQtPNw
	2YS98PWHzXTAxoUW205w/x/LbxEXlBgEcorSQZF1kxk3T2zpA4Aej4F5916L31GAKyHD1HsEPAB
	AxsvN10CEZHrCf5ZEdnCbWZw61wzKunOrjz/yVEUk0YPaBIpxHLLEw79+uHv0lPjuG7U/LSwFbG
	YdZNjPPxw/Sirhw==
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3873519137.7.1788447749816;
        Thu, 03 Sep 2026 08:02:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa1:b0:77a:2268:9fdb with SMTP id ada2fe7eead31-78a1f23df59mr3873476137.7.1788447749277;
        Thu, 03 Sep 2026 08:02:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm74128345e9.1.2026.09.03.08.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:02:28 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:02:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2
 PHYs
Message-ID: <hnvngqgtesfyojftxfuqcsc6ajf7prrlxmdk34j2pgtjmhse5w@vo57k4jmlgtx>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-4-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-4-4c3f980a4560@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfX8AwgDD3Zr21u
 rgDVuamZd2fzKeBReW1eu6lK9rvCVdi/6yjKNGrrXIn58MAvagQFMNDqDfux3qQy2O9T3AYd99m
 PaHfUrR1F2LHqZkXJFaiczDMA8EJHVtAjuyeYn1gZgJt6Q4wqb6nnstDWy+40Z8//zq7JRoS3Kn
 kxLc5In6RX6yjzgp1ZeJCTxyz2TqR6C+5Zr+RWAqJ/+IoQYrjqRh317uxBTDGxpY22lDxn7iVv5
 i6aaZHj95E5U5xV9KcpOdd7XllDPY7MISovFI1FIiKV5DspTnDdROxLJXoHcbAnC4iMr6FPgvZ8
 ssXmo11PNBt95ANX66WYr3w5D9leV5rxIM1ntG2clm/S1fT0mZ7J0DX3vFaRybVYUL5nTkfZdTt
 LQJU3fWJRmhdd9wf45rpEUX/HsQm2B2UUwvjcakKRpxwSCaDEs+39rl0g2fpT1+FiMdkHBvQgC6
 4PvGrZ1xp7TQ4kveKnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEzMCBTYWx0ZWRfXyRStaN+Llup0
 08DEyUm72DTKITZAuQtOpe//tGkhxc62YFg/fmT8VqcKY/9U0bbvDQ7QEY/y0863c5pFFAv70zw
 KE+3LBUUJVTWOy+Zf7unNrwaIMgiQF4=
X-Proofpoint-GUID: ElmMMfL8tp9yxAsVeaA1xg38U2BvePmR
X-Proofpoint-ORIG-GUID: ElmMMfL8tp9yxAsVeaA1xg38U2BvePmR
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a998c07 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DCX93tUFo-QliEHFFTUA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030130

On 26-09-03 16:25:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The QUSB2 PHYs are powered by (among others) the VDD_MX power rail.
> Describe that in the DT.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
