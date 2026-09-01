Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9942239281B
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264748; cv=none; b=WU38OLnfegH2kALrd/1DR/nWj9N7ue/FXwrnqB+TjBs9847dZrou4sdnsg9iOVvd7Zn4g3B71DYBWNSVRyiPBk6Xc4vOMHz31ZN/JdsGeRHBRmRsn53Ofxsah+220RJTFiv/J6aSoHCXR2CFGk8kGLduBpd3qZFFHp/C7D5e+iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264748; c=relaxed/simple;
	bh=A9vl1r0BI/Zpir37RB8HZ+kyhB0NMu1J6OC04urDuPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gNhN4TRy3+3F5BiAWgLpJ8XhXVdwbBxZCWVoyoAHlJxNO8U4mkHqMwX/ySeob15Jx6l9OqKIkYTKlLMms/8hhlYAsKC9zcgKLaqyivTPioDIXhYcJnIh1mEBOnGanCNr0jL5TnfwkJXIDOqfSYSpB2AxNUnI4e61J4MzXjFo4Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CzpQunau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N5uPE/CW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CzpQunau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N5uPE/CW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJfnA2141716
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KEYrBdhOrwPTRM2hkx/oQbVx
	THX6TdT/1NG+UteDI0c=; b=CzpQunau48fyjiECCIjdPOsAO/0tTqwBftvpVo4a
	qeH9dhrpAzMRxvHUUesCOAuVbAYhrKS4WAqaBjkr5nKI07F30rGWV/npjY+D8tWp
	Ygxb7FY+PFTY6GGxns7QPKqjkc1jfSYMW01kNMYwaCJP8hieJHeOVwPcfrLhid+2
	yHdesmt6zg0O2lZdECU1C/kR8VMdaCxAmDDEkwCC6iyTUcnS8Iw4qfd19DSvmNUa
	JEX8NpvL7XKVEw4URParYBrQqVC+8gvz0qaifI19NhpqLE7IYNkV6WYz9NrJeupE
	IUa13gsk3/TpvY0iULZ/cBQWEbmAcQpRzlBwu6E+9M/ejA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8ft5rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 12:12:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so583120785a.1
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 05:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264746; x=1788869546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KEYrBdhOrwPTRM2hkx/oQbVxTHX6TdT/1NG+UteDI0c=;
        b=N5uPE/CWeDHwFQWw7PSEc2+8izReiN3yXpmU7i8YRxNxgLEo9crviYLg+LYo8wxNRc
         x5kpB4RKPLFdHvxFBTWyMmaEOY+7XCZylWpVlBfMvivuYMhxyPZL0KLFs/VWoBf9NCHz
         kFRT+eYiTazC4JY3IJVwaDGhFoDP8NDL85LMYQW7uDpvsg/GWjs6kh0ia8u8B/mmZYEi
         7mQjwZAYDj5I4BcJ4JjMCdtK9If4Ufpfk1F+pou3FIdbCVsZKOF7PsySNiPJZDfzTDZW
         KqmxJw6PJW4+POPKLFDtvLl9cjMmZYZOttw+1msD+0slYWZFySkILusjR1cfZF5NQX3s
         aX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264746; x=1788869546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KEYrBdhOrwPTRM2hkx/oQbVxTHX6TdT/1NG+UteDI0c=;
        b=F+jPV4R2FGHvcXQAk2RPuEO4mayX27rGiMCawRSTVZWMdlnsLwj3yedKzV1vAqRsmH
         w2PVRGuo5l4udgmE2ZmEsLvtNiIm2IDyQAbLHG3m1zrKJ4xxDgdSZW+UBzHD2IDY7c9l
         deTrplkysGO3AMSLh/vJdqY2lMIoVlINdi39WtE/ywlaazWyL7tSBZ9Vv7xM6i037/O8
         nsY/IaA73VSz++2sU2Q0Yw920Cx/n6s/uWPapdyX5wwWl6xnPIN7EJaZmA3TbRZbn0pR
         lKiDLP9UWHwFBbtYNphLAy7YiYiC4kxrwrBFs5X4IqOEFgUcNCKY4kWn62K+ZlXUtLGH
         L8pg==
X-Forwarded-Encrypted: i=1; AHgh+RpUJeRz23fxPUv6FG2f/pZFDt8b5uBGgE8ZLKhoZJI82PI+BPPANPg/I/BDY895Km0/DD3RCoYow9Ce@vger.kernel.org
X-Gm-Message-State: AFuF++lo2Q9LoRdHTOIB/Zw22kAwz8MEY7CjV1R8fZofZtWg7OmheL+M
	XpvqeldxrVW5PS6Y0QvYkXM7tnsfXzTeikEWJKREoK+kTWRRcAnG8Hlnkt9LGyWtWXjzOznBWAP
	CpoGyIAX2If2ibNbSwH2KLtXNV2l36ljx6yTNvVhnXHZ3AFYvMn6JZISm+UXR+H3K
X-Gm-Gg: AR+sD11ZkrR9N3lH12ZzkVVR/Ty5QslCU7IFtxJSEgQVDmJBzB16lRZ+m0D2EegApIF
	rn2RYUGaYnqrcXkMZ1vQThsNuiKx5xdNn6cFXmvV/BdfYRAAiC58il5+7YIZh+vHqjZBn0rrxSh
	eHPulNzAeSF1PF6kWI63XrEsmbNPZeHxXz/duYsbxtM6gFucjfSlbHF1tnqYy0GrahQ6iPl5Nf0
	o6icioolkCi83ntU80PJ7pIEjLOcv5ScsQIDEP0es0o+qfnW7crBFS0YCDpRZHoMUBNDNj68jbN
	sbF+xx/royN/Px7rusIUeo3aG7yYKYlH0gUaTcxkwoApoMia1riXzB2gUtpXpuU9WdVdH0SSC70
	R9fLi6OlLn7SYVA0=
X-Received: by 2002:a05:620a:1984:b0:938:39e7:725 with SMTP id af79cd13be357-9394815a333mr973251985a.32.1788264745621;
        Tue, 01 Sep 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:1984:b0:938:39e7:725 with SMTP id af79cd13be357-9394815a333mr973242085a.32.1788264745018;
        Tue, 01 Sep 2026 05:12:25 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1e3a9sm63700565e9.15.2026.09.01.05.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:12:23 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:12:21 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
Message-ID: <mf4czulidvunrfm6evxvwf4ds22jcdgn7e37xnhhakw2zrl6ug@aenri3zg742i>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 3G2TUzOMLDni4OMwX7n-WKcNB6Se4WJL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwOCBTYWx0ZWRfX7a69SgNB+kBI
 PZDAsGq0EZm3fas9sVpOyOvV5pGjMgvs0+2aNCNPBkACrAVMKp6OW8S2oVQ56G8xFf+9ZrPL9id
 bkXhZ7LmgS54Heu8vYnxZJswzQHs8sc=
X-Proofpoint-ORIG-GUID: 3G2TUzOMLDni4OMwX7n-WKcNB6Se4WJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwOCBTYWx0ZWRfXyJXLlHpivtyz
 vQHRjBer+nwUZoNAAaVkyPlzDMuDw0ytcxHJ5mAghXwgwSHZTO4kHx+h2zpr2PzmxsJN5Xhluxk
 8cE4BHTPKJutkNERubjdPjm+h4nAdWxuz3YX7apzHSK7Pr3ryHEasKIuFwIKKN+U4bkAktx5iWJ
 TuJdzHhmB/jDnLF+dGM5RoBJlCiYmmLb51iW5tGMESMNr/fqRglgfMjq+Qh+vmYT/YpkOCfPSpY
 CLqHrGXBbavTQA3JN2mpgYjzcZsHD5OBl378nTFslJvboOVzZwY0ogWCXi1gycd2m5qbQWtdvEk
 cJtO6HrZx8joH/mCEqE7J5xhardWvnOjkFNNDzLKTFHptb6YdpF5Tlf4PjQilXxWBlo76hWOayf
 SF5B/WOthYAdgkBDT+kHWgKSuEVp04YBT83eCYwVHadvoxFeTkaM0U3F30c4yE2U1A9YDTWZZ9H
 9lCsC9/jGAAk6NkAWOw==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96c12a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fNEQ1mXMgSVCMssgLcsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010108

On 26-09-01 17:50:55, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
> are identical to sm8550, but the sub-blocks are not laid out the same way:
> Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
> everything else where sm8550 has it. None of the existing offsets tables
> describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.
> 
> Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
> entering and leaving autonomous mode: it now uses the real AON region
> rather than falling back to PCS_MISC, which is what platforms with no AON
> region do.
> 
> The offsets were confirmed against the Nord register map for both PHY
> instances, USB3_DP_PHY_0 at 0x088e1000 and USB3_DP_PHY_1 at 0x088e4000.
> USB3_PCS_AON_CLAMP_ENABLE sits at offset 0x00 of the AON region with a
> single CLAMP_EN_B bit, matching QPHY_V6_PCS_AON_CLAMP_ENABLE and CLAMP_EN.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
