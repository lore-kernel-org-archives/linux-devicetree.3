Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22073C3F48
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784833667; cv=none; b=sNMXkFH3iMpWa4b4WI/j6aCdp9i3OgCGLrtFjyB+0EcoNGrtomHsrRPuY+E7f8jHR5t+1mc+0fzegYamYbRVpKpLLCvcL72cUA5o/lBisruQJQ+wWZhxFYooj7uHRr0SHDUYQ0UYqtSbphVpQYBglGwJwVMwtbKZsez52eMyTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784833667; c=relaxed/simple;
	bh=094UwvJU6Tc333A6BTBZeyDFvPxqAHfwYg7qVGbLxDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TuMmkxMPZ9NqU9qwokz/W8YThAIB3CEHglv6V7l+fjImQfmvET5yUI9iMWlfabh1aGTvT4honVns3AZtDxe+qL/p+C+L1QvPyevOsglK0+Mn3SC6eIFZZNMofvz8YJhSvfIcXPZUh77aPV091o+K1e91mBxzxoDEygr3/FyxmZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H3lXbx7M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fyijTqCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H3lXbx7M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fyijTqCO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIm6Ye443099
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q/mRi1bjMPBejJxV31iqf7/g
	77qPxMAdhKBB7jv1Ixg=; b=H3lXbx7MGqlGyZSnCDtM5XzLp81dPJyR+Z463N1I
	mSf0NQMGRWqPyKDhJNAhyUMvu2bZigCzn88cMDe36F0C5Ocgn3yzJowuTAduCHl6
	dwkLQbGnFQ+wc7cjXlF6nSmnCqyaJ5pXN7hOOYgnvxuSZEORSR2EjagYU/fikg7k
	sb+N0aW+sqOuggLl1wDQzQmWYv2sGIG3vhowjlRfxFCohcQGtXFum6eFadUGV+IA
	C/UHSBSJAwm5/jvaa4cMcCpDb50FEX8pEHbOMtBQD3x+ohq+uOCzPxK7EhLWMx9u
	mmQGudCF0KETMG5hMbB0ndn1KYsij+nNl+e0U5+pBhQZVw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqajrerv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 19:07:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso19551371cf.3
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784833662; x=1785438462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q/mRi1bjMPBejJxV31iqf7/g77qPxMAdhKBB7jv1Ixg=;
        b=fyijTqCOFLHd6Seq2zpD2iN8OB6ODJm2T5BIciRWsL9NgiWYIj6Qp4OQWJTUb1CjDU
         +D9hUX8qwc4sn3iirYiwgO0FVKZlKGQEQKyIv3h62UqNMGgZqWG0F6qxEYnLgZsEKPUB
         StTucKd0WxNv9o4Bj3cp8w8w7Rn6jrj+a/zFbxTGGnIDB8Pc6q/KeD4UzSAnaBKU4oFi
         uhMY2rF0fO6jjvHIjwc+yxXhE3XrSzx7w8ptAIRxT5rpz0vfjV/t/+y6gC8RngGet9XO
         O+lM8JwWNU47a2FwvkIhbAyyziVmTcdV1CQhCNcsDCOGbIoxsxPJunot+87H81TcUF2f
         F69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784833662; x=1785438462;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q/mRi1bjMPBejJxV31iqf7/g77qPxMAdhKBB7jv1Ixg=;
        b=NARLbhpkKG3c8sx95aymJelaeH1Se8o8b24SIrnYuUMjdYjPbRuLQEduwHyJ1DMxa2
         0zCgTbosHlCsX8GTRKY8QvSNUNSQkLCY2ofuqma4+MXZjgaudTO24OJCBzc1x0pMykch
         4beqLHf6Vblxuv9705YYCPveifORQwHLUNOy8JqFuSngMqU3qnfQcynZWx68aAF2tu8O
         hGfkJki9eQ90C5F3PUkd71sZ0AW+Wva43WCBbhKbfRBDcQ+w+K9GQSEW27ktC5U4esPq
         nL3iQUcAQe/tzSIJ5Gc/N+OS0TX2RY3KW6vy1uH2HWCiomOB171P81HuRdD7bi6GpH6F
         oLyg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+xEmoEQDI2ZsgmhJLRjxLComU5iWP7a28ZA/7NVu+hNSH50ogDLl2GSwx4T4Gti5Xx2BlHf/PMRBm@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6bQD8OTdc3NJ8HWqdkEOexRAkuhForq16tdVuZEtljePBuaS
	9cs/dnmakmqhL8XHV/x5IeOgzlAKt9UvnZh64+q6dnuGs/8YXcK0jeIbhRg4fC2auJ1RYbItI8T
	3QlbQpJypy53Cz/74gvJpf6j7IchEpwG+64dCXqmDBUyqjWsf3BsZsJ7kjAPWBE3WURk958qm
X-Gm-Gg: AR+sD12THbaLB9D5o8CX9UaomwByhpDSaEyUgEO98MuZFCP1ImY/Rj4yxSKBCoT1lUM
	HXhawtaNYVMI4VzE1Ohfni3SXo2HJb81BkxVlOiAbpzGBstnOaeo66Bk9IEwrKBro40Xbf4tGDo
	RUIhHeD0y8ZX3fr09N6PScWvoGUiZvDzva7xjKK1gFT5V+X247t2YxNdzr1ubx8ZiFTpEy6FfPy
	9Y2HHEhWoh/sxSu5J7Oj8dTyGA0oh6x/zB/2+7LbGXxpom4ZBCpv93axmmOBx90YrIBBVtipCQH
	IOuPTyTfTth96ItJzP13oQkKSxlV7TcDifEcRbDl8FTc9ODCy7S3eLc3tRwmfbrpOBSYpOlgw7P
	JZvQphDprqQ1T99ToYvCqb4Pk8W74WD9aXZzWeTDXkQ5qsnbqzRhROqAsDRmHyv9Du1MdgRty1J
	KS0hlUJbvmbPC+dw==
X-Received: by 2002:a05:622a:5917:b0:517:642c:8196 with SMTP id d75a77b69052e-5283dda80d2mr47439451cf.12.1784833662352;
        Thu, 23 Jul 2026 12:07:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5917:b0:517:642c:8196 with SMTP id d75a77b69052e-5283dda80d2mr47437901cf.12.1784833660571;
        Thu, 23 Jul 2026 12:07:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e45344sm1135899e87.64.2026.07.23.12.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 12:07:39 -0700 (PDT)
Date: Thu, 23 Jul 2026 22:07:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rahul Samana <rahul.samana@oss.qualcomm.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_hbandi@quicinc.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, quic_anubhavg@quicinc.com,
        quic_mohamull@quicinc.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: kodiak: mark PCIe root port as
 bridge
Message-ID: <e5xsbfnsauqkvd24ztew75gqh2l26vbwos2pgvzrhx2qgrq5v5@cshq4gfumvtg>
References: <20260723-rb3-industrial-bt-uart-v1-0-3c8e580c09d1@oss.qualcomm.com>
 <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-rb3-industrial-bt-uart-v1-2-3c8e580c09d1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=WNZPmHsR c=1 sm=1 tr=0 ts=6a62667f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=b3m_QctH4RwnUCLtgwcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX8X9VIlzAns9K
 N3QM/gGvbwoTfoX0RW/rDV2v1pZ6OVAqac3lIx8XSxygj1HMkwY3yQY0nxKwJzRsQOL9mtXBiNu
 +dNHDm/gx1JK87HAsnGEvA6YN1Vs9Qxll9wGSILIYeYCLQCC6M45yOyfvB4cwSZcsqMUZrxmjye
 Vc+jkYGkcM3wstIep3T13rdurmEyI7a/fac93aorSE6wtTB+kyA428wvitjGtGGlwHIiCx78ddm
 5KWHdA2UaFmvhxqqubZw+poCv4l5A59U8g3yOJvNj/oTEJhHtP6484USBbN8tzMjzt2nKqT8lq6
 YeZthOaYEKpgH2FF+l92Zcnt3HsuR3/LClm1VMP2LEigGhf5GxzkNsbF5rSe9cbYEtPB5xF/ddd
 rQffx/HrJrmYbvLaLYXoC/Cihmx6SekJdzwTfn1APb1unHPfbjB2McUMhsetxqIrRWA9vAa2jLt
 UpfUT4K9fOorl+97x6w==
X-Proofpoint-GUID: pbIQxIMIogG6t0WnsEtSqBI1FgOtVuTE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4NiBTYWx0ZWRfX+DwnORv34PEm
 3rJ8807d/IycKM9TpeuHVBGVg5YBfb6yVLGEgBT68uV4owh1mKiY1iijB5itCNXSCQlCPlMwAqn
 e4AlgjSbEuVdIcaugdo7xq+fEiZvGGQ=
X-Proofpoint-ORIG-GUID: pbIQxIMIogG6t0WnsEtSqBI1FgOtVuTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230186

On Thu, Jul 23, 2026 at 06:01:08PM +0530, Rahul Samana wrote:
> Add the PCI class compatible to pcie0_port so child nodes below the PCI
> bridge can be matched against the enumerated PCI topology.
> 
> This is needed by the M.2 E-key graph description used by the RB3 Gen 2
> Industrial mezzanine Bluetooth UART overlay.

First why, then the list of actions, not the other way around.

> 
> Signed-off-by: Rahul Samana <rahul.samana@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kodiak.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 

-- 
With best wishes
Dmitry
