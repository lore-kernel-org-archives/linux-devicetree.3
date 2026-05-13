Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B149334A767
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778652620; cv=none; b=B6Zrw/mcFxO4V19O1hVCc8uS8G9dj1+l74jN2RNMBWvuUDSPu/GXLCKinGnDDYvUesHZhBJsOZ6ydCAH1zJCGK/A2qADggLTzyoF+WQsNHJtS67WCVsAeX9Uz9YwYRhBj2sMvTNHgIaYjAnH7K1vOvTDGAW2gcZZHWl0ZxKL2xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778652620; c=relaxed/simple;
	bh=dggwVgQZYATZcpFGtaCTQytuYjp6og6z1rYuBox7Xcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCT+M6OB0/7yqLDom3D1ulalMhrIpYnxYPT3KKZb+5s/22bpeS1sYJVDEOZGXWveqoupIntE46VrkpbrpVvCbMN00S8Bja3RPnTP8BXcXc8NJCe6xkgR3l4aV+WsU6kwsUawSPWSzdHNJKxKGgbwLbKeEcsSHjGbRWOZcg9QThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JAaKKz9s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcWMM5Qq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JAaKKz9s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcWMM5Qq"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4pIBo978386
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YIyBRKcx8/a/vOQXAbbJJ2Im
	8kJF/PgRbMikuhNIDuk=; b=JAaKKz9sd5/Au+Cyz4wwkJyzbsA6dKhrUxkFgoFo
	zv/KH9OrzBHNX8I6Z0866cI3x2jg0SHIhubONfmYS2qMj7CMdN7rXwrEBab90vTe
	zS4Y2l8JONNPkJKgJiqeKiWRLmitGmXLU3trNMg4YoTFwJE/YOvdbHqrpeWpk1a7
	Iy8ZdfSq+Lc/gQ7ZsFfdT1/U0jf/2YJspYAfbxmQ/1MRY6aYauLbn60LoB7RX/Kx
	1yKCgI4JabZMCGNv7JtBd2xWRSYIWyI6EJyG7o3zTHaOZzmTZJaH7YQEY5qyCaWG
	mozHmoIY2n37IWCRrVUNrDsiHbuiX3wLI3riQhwBBRU88Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9ttqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 06:10:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514a182b90dso47900851cf.1
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778652617; x=1779257417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YIyBRKcx8/a/vOQXAbbJJ2Im8kJF/PgRbMikuhNIDuk=;
        b=gcWMM5QqcIgkInQJLBQ8klrfZEbD8sRbfG5uHmwPeyGi16hab3aBeJ/N63PGxmBx7v
         jIyBV/BTJTHHLF5v92tGo8Bu8+OKqh3GAyoL+IaFnk3SGetROEimvaXbomMMWjl4DgOX
         RtK3yHb9fa3Jx7seXopg93pFS5uTfEHM+s96CS+4LElE7NKWkEWKA+Von5HFPaUtReA5
         004F3tiGRliWQX3gT4pBiWwNhdjAWsPeIuFnRuT1RrmHHDCgRKiiiPI/LmsfKZT3K+R/
         P+ci9Y/J7RPCzKArhRgvaC9VH3UM02p/YJXIPbrFgNiFqH76bkZ8ZM1soOJoRfqvdxp7
         d7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778652617; x=1779257417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIyBRKcx8/a/vOQXAbbJJ2Im8kJF/PgRbMikuhNIDuk=;
        b=UO0vg2JT/wR7jFPE5S78EXGpZ2xsrhxqOD/kjbm7zu251KvnzVRaSPJkAlJwkBlgVa
         OlGgBHJ4Y+ZJAuMQz6jMxSKiCEMzy9RNSNoOzG8EEP97LLTKuDLcCPAsbwrRTh97eWJq
         WGodHa+A/x3JdcNd/UcAFoOMKqQ8IDcDiyeRwae2d9dFruq5BwjEHY9Z68NqK+asr/9w
         01GUMqDmhkG/v7wEo804L4UOOOoCl1pZZEbP2AY28hfT85RVSDIJUQdGWGu4H+H+Iakq
         FY7I+SOuv6IRB2sDy5kqHhrMDAZ2Qdge4C6Q6NCVVrEW90XcbZ0B1UydVuhPymriR5Za
         SRFg==
X-Forwarded-Encrypted: i=1; AFNElJ8f50zoy5a3Ezw4ajCTCR1tl2PaUPKg4T0pqkITd8E8cc+slKw6At+rlpoQdt+NAEx23CZt5YSJc2uD@vger.kernel.org
X-Gm-Message-State: AOJu0YwzqOURTdX6ZseB/yxduoyQD80QPJ1gfg9nKDUypjReGC4YR41D
	3Eyw26tlLNjRo+8udTM029ZfNajCcUYYdpYy5fT9wUOVlzAMQWFPmeH6sGJUsrlNvDYzpOwpK/B
	i7qdVNgnaHrIdtj7yHZqJL8GIhxXmGkj42q20Pe/ogj+//79B648l4TJUhJFHvjJG
X-Gm-Gg: Acq92OFlFRHcFCSh4g9Txa3LVhDAo/fTjsuNC2JoY4mcBOUl5HW4MwjK7y2lKMkTe8S
	bVmXYeb0IVTFdO7Qu1LOP3FJubpnocyDuQD3yE0Nakv05i+wCNHXtpnRcGo8anMsoQyRJe1q9ey
	UP1Zd95OlzB1pQGYIPc9gYdHLcITHHnbq/zwsJmZX1gPC7xcmEkF/QDhi+5CaJ+X6HbDjfA1h6I
	31aAvgzKl1gNrhS6XJdFmajs1limR1+K+UMwBy+B1E3C0Zikm2X28XANiPbQfjjUzx7zGh+chtQ
	mo00XRia8AIH2zn7CQhzYvp2xq+v9EXDurxE0rUNVa+76LzydnbFDG5YryALCYtG5HKYUsWtLRS
	3hOQWH5BgGUOb2JQeVPqOH8VKH+xM8tqj2HfvaT9AXCRUwZA=
X-Received: by 2002:a05:622a:1f0c:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-5162ff467bbmr20543291cf.38.1778652616893;
        Tue, 12 May 2026 23:10:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1f0c:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-5162ff467bbmr20542941cf.38.1778652616255;
        Tue, 12 May 2026 23:10:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce37b308sm46365135e9.10.2026.05.12.23.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 23:10:15 -0700 (PDT)
Date: Wed, 13 May 2026 09:10:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: eliza-mtp: Enable USB and ADSP
 support
Message-ID: <7a6tbenqnogpk3pbigds77ogo2zambykt7i7jshjhi36gam2oa@3hrp3icontya>
References: <20260512-eliza-adsp-usb-v3-0-6420282841c2@oss.qualcomm.com>
 <20260512-eliza-adsp-usb-v3-3-6420282841c2@oss.qualcomm.com>
 <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bi7m474cmmnbdfxd3kzdt4hywm7teu3jo2bzywk4x2tx24lh6b@xhdfnm4e3rfs>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA1OCBTYWx0ZWRfX29DrEKUqBlSb
 FjWSXWvUHA977Elg5E1Sba+UqgcYHCGM1jIkYkZgVS6lpxnavOOJMNDdiMV1cpozBIRx4AHNyPY
 JtgAYEhHEi3lfiFewOX+YyGJGLpVcFmP4HYimA1aazkF4y3mOueqnWu8EuZpvHhsU2wrsb0pH7Z
 /IhEBwXAla/1u77vFXdsJHUVKwbMRSHOTCQIlgg9KjZYHZckyRY1PNH48tHr7X1LWlkJFGhnuHj
 CIedwmAiR6wJExyqOYgX67tVIGCQZDXbnrxho7SVrmy/KiXyZvNNrRC6p6AxchJwQbDYcLy6o9w
 QI4+kG0IcPfXvWp/4/RyBdOPXvHJP9UxvPgRvgmIWgSsQRISnjA+Eflol8B0yo37GTm2n1Ujs3q
 LxUDrMDmSnQZTINSjfEXD/jTdioKyHD3Byoh9zlk3i97lyl7ZTOrgUk/TWmndaBYTQpnl30JF0s
 ydWzed81R6JUNVJWr8g==
X-Proofpoint-GUID: tYb1DPOqBTQn0awq4CoF8bjEpphygbkS
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a0415c9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=i2al5Ykz3Aht5zOOcbIA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tYb1DPOqBTQn0awq4CoF8bjEpphygbkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130058

On 26-05-13 01:04:12, Dmitry Baryshkov wrote:
> On Tue, May 12, 2026 at 03:26:49PM +0300, Abel Vesa wrote:
> > The Eliza MTP features a single USB Type-C port. Its USB 2.0 lines are
> > routed through an eUSB2 repeater provided by the PM7750BA PMIC.
> > 
> > Describe the port and repeater, and enable the USB controller and PHYs.
> > 
> > Also specify the ADSP firmware and enable the remoteproc.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 81 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> > 
> > +
> > +		connector@0 {
> > +			compatible = "usb-c-connector";
> > +			reg = <0>;
> > +
> > +			power-role = "dual";
> > +			data-role = "dual";
> > +
> > +			ports {
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +
> > +				port@0 {
> > +					reg = <0>;
> > +
> > +					pmic_glink_hs_in: endpoint {
> > +						remote-endpoint = <&usb_dwc3_hs>;
> > +					};
> > +				};
> > +
> > +				port@1 {
> > +					reg = <1>;
> > +
> > +					pmic_glink_ss_in: endpoint {
> > +						remote-endpoint = <&usb_dp_qmpphy_out>;
> 
> No redrivers?

It will come with the DP support.
