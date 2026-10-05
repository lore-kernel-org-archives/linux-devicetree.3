Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E437A839
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 07:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184418; cv=none; b=IjaXTUlu7D3t6qmNFyLBn0fGGTRO+NNTseihcEB56dpJ/eoMJkKg8hbAF6CtCzNTgU4ZOAjmSv43BE20216vPhauTQSTI+qjUzexarnxL4r7f9wT6mRfNjiCJ0j0xBx5qW1f5O8Pw9gRnfkFn/5jdO1X4UzJlqGDdMbJEc0tUYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184418; c=relaxed/simple;
	bh=0p7b65zRfK3AvDpfAGxrxQ9vRKqosGAat4sY3vmaVEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MibqqHwFO3D0xgRlzg1V+qn6Lpk/JfAvXQ2CgsbUuZVL1eHh4tDKiZawbALhIRh9oji8uvoi8nkh+fqj17PMhD3k+EoxVNisKbHMsRPfb1LXbG8ScTZcUrklB53XCEX9wnk7iM3G8tOcq4X8yntc+4i8RBCAtp+uaFn+TEjroZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XMhB5J91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KwzueXmT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XMhB5J91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KwzueXmT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510NMN1411592
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 07:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MxyaPeOQSDUKaVQU5hOQMfOj
	aOY9QlWveH2VyoiJ+4k=; b=XMhB5J91ggRI19ODEsBbagxI7i4+b/QKkSNacgXm
	Jb3KBCIaljklpMXzp38950FIlCADwz2R64tIfgJ776p6A5EPnhzv6JDTrvB5HYkd
	/vEg5uE/S2bUtVyeGdbePJ3tE3btUUdye1NJA+alEz33goXTyPSt1D3vLg0l0wKh
	MRqLcx8QIcptnr5K/HbsauefRbd8uJIywKfqy8wiOh9OIgy+yQKkev37+eEH2BSj
	TDj7GZuRp7Hip6k9jaH65g8gzXpA+DU1OWsE1unw1WEQ3xjkYQRwv/afvLV5SCTu
	VVTIvN3ZVi2D/0kQfUJVh2a6xgi97vhPfJIlCaHBNTPypg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2sr6cuw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 07:13:36 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so51591036d6.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 00:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184415; x=1791789215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MxyaPeOQSDUKaVQU5hOQMfOjaOY9QlWveH2VyoiJ+4k=;
        b=KwzueXmTojpx91j82Va5QVro8DC2y3Es+aw0CgL+stVpPs5uBYESnYKemiJ4BgqM+i
         EmzUUSrjgsEKWIaOyKIw6SRnbD5GcoSqKgk2RErDHAzf5mX91z4TFdJgR6erlyWMliF8
         SXwENXrXduREqS7IGYGcVdwRk6wJOuMERPDgbnnro8uwHs7BZbi0GThnK6Jz/sl9eNDU
         WzdjRgOS1G12EwzX98//opLl8sKLnWAhMC4qvoyzl2koiWDJwBFL9W55vqgV/YmCdUWY
         lUrkEqqOSGc39FNVJyYwUcb5YhNGIt6+m0T1nyhi/vxH9KrduBqw/53gUpmxnHVQbQe3
         e13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184415; x=1791789215;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MxyaPeOQSDUKaVQU5hOQMfOjaOY9QlWveH2VyoiJ+4k=;
        b=QI24Y1lJYYKjKOvrnDflYC42bLJAVaLgJ/bwHG7RNvDruz72RE7yvIbkaXHEfh4Czq
         tad0elZ4IszoZzRqhMf2lbsJzufhBMfDcJzg7+m+VRSiFKkV5QUNgx1IXNBWbLF5OwOy
         1PBu4/oOrXNbihWp+3F/vTtYQ83mXfjweC5vHCO5zmJG3RLfkz5ANMS4g3irhoRq/3Xu
         3VYMPObmBkM27RkCYJELpmu9ItTykYNWFIsMDlWwaFVf8g/bwxpMhdTjqIUCvohTxtXI
         yNMkWzpNwt14YBE1MjF/NSEWLOoEa4xaH5E5g2xC8B/nqZ11D9TMWKYoTeXGwrSNwR8Y
         md5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzo4HXMbytFcN6+utxsOgC1hYSAgePu4loGdcQAifk+LXeY0hpJ2QeSLTAXXZYop6GlnYtD/t+aVHOa@vger.kernel.org
X-Gm-Message-State: AFuF++mlZqdZnWjHuwhnffxu+Y4b5g6YtkmoKs4mcLzfspJgF8RB1ZX0
	QXLmVpIJwVeaXIxdTdY6GshSbXWFkIOuk+9fGZjMRgSw7g3Y2AcPf9etNPPm6UTuxz60P8gPsD7
	hGVFuGiUyGA0BUMw908gnIvHn2/amLL2ZvNasAD+CEbrBI4M+YYJr99m7rGB80TR/
X-Gm-Gg: AYBFou2Wnl0gSZO+1dFKArBkUznXdqllNBsugv7c87Pw1c8mjjBRJCsLPldoog7tHZs
	Soa3P/0uIxXa4M2vyXmEifxNmeVbkbJpwCpv1rnBZj9PPK96FLVjsZw53cuQx19mZDM5E9Zskk0
	HjPaXVAoO8zrvo9xS3QF26FJseeTJPtgxcFoAKDuW/eDPzbcrIs4At2mpE0rEOlYThKggVlSxb2
	LW/MAo9NchRkW5FVaNZ9W5x8rPyF6it3zQi110ZgKiLFD5Lj3Zi3uSewk9gKKuwvSUy523LoZER
	KU7mkG4cl5EdIiHuyZWmbWN+l8aSBFY3zxAUa2g+wXzqh0yAzdJujsNWOWxr+ix6S8qE862Ax1P
	2cuuWPGjGZAn4cQAYrxheKqPE4kr/ckRPsPOI2rKodoxHN/ocBBkJeD2B22CUOjNJajCNm9tIRo
	Xe6s9dhV4E+OPH
X-Received: by 2002:a05:620a:488f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93e51025780mr1139528285a.36.1791184415059;
        Mon, 05 Oct 2026 00:13:35 -0700 (PDT)
X-Received: by 2002:a05:620a:488f:b0:93e:4e1e:aafc with SMTP id af79cd13be357-93e51025780mr1139525585a.36.1791184414633;
        Mon, 05 Oct 2026 00:13:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bf1a9sm2990635e87.84.2026.10.05.00.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:13:33 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:13:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] phy: qcom: snps-femto-v2: Fix
 qcom_snps_hsphy_write_mask argument mixup
Message-ID: <7i4rxspd2o24hron5ql4kiccjogqk674foyxaw275mox6dvn3k@cjmwsvebg2su>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-4-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX/PuNVCr6Zkeu
 DSovSEPoiUtTO+d2MsSINg/6spTgKWv50rbaDgBpdexZmKUMbrh+7BpYiMLzHuEVdIdkkxfADT/
 qL8d2zS+6BSssBOEqBxeY9FwOj7lHzs=
X-Authority-Analysis: v=2.4 cv=NaBzRGD4 c=1 sm=1 tr=0 ts=6ac34e20 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CZ6gSvR64lt0KtMMlSYA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 5Gypxf0GXyveAnl90t25bBFA21AFdTPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX03eoGVECyV7z
 lunoOb/NNjbAf9OP9IfXj2YWqUbHR1r8DZHr6F8AxWCU//vhe1qPMHPZ2isRNXHLcW1pJrkBE9Y
 9zhL4/ISBck+Y/FQT/VC/RkWPAv2WRXyNE3zWlE9FgsIkXc6TllP01pNiRC2cFuMT/SoWfq1MnY
 lPpNaAu5lcTZyNP70j/z2rcV60F1tCTz4bTs7OIgvjB+0ONoJ9xjXSwOXCc7/qg8BEYAVSx+Cfl
 Lgrxdl9h8nmCWS4YY+GgpXFypR9SOIzHtiF3tLYbDjVQI6MaE/sdFTBPeLvl+3KnIzkCkqoqJab
 FVoLWSIK+dfBa6SH3rnRKQ2NPdK4PcYJ+LoL7DIySIFIIiXVnjRhXsm1j/lXpdNr7iSri12fFTw
 rs+K1427q8yqp0NbRxC50ml1MgkhDnJ9duAkF34fR+hkzVnrs9TU0t6Rx4ZPC2N6XP7M815+I5K
 dVb5/t3sEWvOlYn1l2w==
X-Proofpoint-ORIG-GUID: 5Gypxf0GXyveAnl90t25bBFA21AFdTPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:29PM +0530, Varadarajan Narayanan wrote:
> Fix the register bit field mask & value argument mixup while programming

Fix the order of ... arguments.

With the commti message fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>




> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().
> 
> Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
