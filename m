Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9A13D9552
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393802; cv=none; b=XGcjDxLZkPKyh2xKTFq/k0/s0u518FQ7G50GbDOMzg0IdoOlDlms3MYsSi0BCTyppwvH2QOVZTzHHmsBjk5o1glA32dZt/XH2H7ODsm4ZArK1VB2RpFJQpKTGxMq0AxrUxb1S3wfMVUpwWSaO1eTuVWoDu8sMuuGlmriCrDMBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393802; c=relaxed/simple;
	bh=UT06poTznfl8ZTAhUcuyx70LEC/HCesL6yPpBlRCnyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDu5A5hPXlt6horXaRNW/St3brmDsuAtUgxo2ERrbD2IlaKcuA/6jfYacagXS13cVpQ2lk0N9PQ2Lpd3UBMizurmSwpPF8Fl6lV4S989c8nucaiLmEKqd8YiEdWfCRCenKcfrD00iVgIQ4xjChKaP5bkgVMmT3NVA2LIdVafwPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SF1vugy6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=clyTa6G4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SF1vugy6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="clyTa6G4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0v4P138413
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=; b=SF1vugy6tmxJ9Hb3
	/FBZDLS+4cz7nDXWp1+crGENkhyjij95AdcMLf/rFo8zeXbBVavHGJvBWO6ZlRGa
	sTxJIBwuvKbhzK8Fai+hdLeQpX36RNOdlBbmP9Iwaw71Pe82kEZjyuex9SDZYo7h
	YE62YjGxmLa/kUEaTU8Rqf+dOtXobfFfL2qCniywySt4ktcgriRDKTNEoooHHdbF
	mXwQWtWU+MFmQBj7NeK1DXGEh+fYXbtk6yGMNmollv9EXrgC2Eq582ZpmX6/BLjB
	D0U7eqyZVEvBPfWqFlUhX/CelJT3zX/ys8qTycl4noDf1sA9hf7Z+Uqnugw1C2Dq
	q1Zi6Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8u9u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:50:00 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97cc3dee8aeso29760241.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393799; x=1789998599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=clyTa6G41OmcgVz+BoTYkkRar1ffIRCGqepWY1Uxc+jLauYZ7cGTHER7eetIUrpP+c
         CJ+St2Zu8VbvU4Jsww6rcOlsnzuGI7qVyZFMkxlbDMYqjWIqn77IqH4RgJbfqMt8J37o
         3sejXNeoPsaRjjz/Zkme9YnVbMevWayWwnJpVfSpgn+XNFr5xXDudsUcydOdRV2uw9kY
         7NQVI22MmZohz48B6BUbRyH/42DVGLnhFT4T/FpWKlBDhKktDvLjHzJhWyfUCKT5z9F4
         LPhIA9qxhtEyfgL8BQhLatJXSazcUzfwFTF5wRxcjzS48fFFR1VWaeepmOx2NWxbhzMs
         Qbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393799; x=1789998599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0xQVh0vFCjxQwxfnwMIlrQY8/y+VhxDPksoF/C8V6E=;
        b=AaXjED4fDi9TyVU6FMicQoqxiTv4AENQx+oX1cuOzmoxEIJ+EFC0NgdY2Uq/sTF0Py
         1gEnJeDyENtELyOn7/29o3SAbt30GEhps9xkWUQXNNmAFp0EO59kymMbkAP7hNFPYgZd
         K7hyQZrMnbWlUAG1P5CIF6JCiy8Eal/KtjcJ1ffp29RiJdLUEAkCWuqRQWy/0mde/Wl8
         UyYosSnl0h15ehAObV8QY49HBlXYkZVWwI6API7JAW59OFnhto0a/haMh7qbqNXuk2V/
         d5ziM80SyxYz5rHb97e+NAD0zXDwRf9BB6jele4llkFU63r+kpij9g46rIrmqrZ1GO19
         C0SQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5f1ZJY2p8Cw8Va+bO3rbNMEE6Coc//txb8rSOeEHEUmK4fgffDXg4mgiycGEmqTT/ACruWBStqLtH@vger.kernel.org
X-Gm-Message-State: AFuF++lkuJRDvZA3ExAde6r1Hwy20Wm6wyM4+/8l83kV3xE0lfW2l74F
	UnoVHYKFjyYBBCEkZ0WBjVoo5Z+qPVJDuRvT6GrO3BZdba8Bgd6m7+6t42+CJpIlhsoxyCnB+d2
	VNSNXDrSU8Ov3wmRZ03XcXsmU6rfIY5tR5D0n00Sf2+zW3P+54iHuLLKYQBpc99H4
X-Gm-Gg: AYBFou1bv+dgTN+tUFh4Mm6n9U/jpdSsyrVKWdrucPN345RNqhsgO8fV4lqlUn299VY
	bRckV+8KQJqNFIDvH2/YZ+zWiOLgznJC7ZTDNFBGqb8q6FLC0Y+H2WEhDVY63G2ErZpMGsup6aE
	VpZw1739QwCeDma7pLhoWv7e/49QIkx4UjNrP8wdcKlAQPICT2G5ZWrdngePZ6J51govaAkJSog
	Tt7HNQny3K4ylkwV6cFlrh0VMBlsJS3Jc+f5rU/c44LN0W4XGsY0uMFn4exy1NNz+FrVsibhKJJ
	o7NkC+5u5sOagPAhiyN/aML7IiGbwatsCu8piPB3R2Ws9l6sh41wKYxjieAO8zlVYfCuTRyBI83
	2dkvBWL9tYE2USNFo0sLbDQ==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594961137.2.1789393799278;
        Mon, 14 Sep 2026 06:49:59 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr594950137.2.1789393798841;
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ead51sm440791566b.49.2026.09.14.06.49.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:49:58 -0700 (PDT)
Message-ID: <732f6e8c-d7b9-408b-9bde-7034f73667ce@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:49:54 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] phy: qcom-qmp-ufs: Add Glymur support
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
 <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-5-b9fc5e2ee99a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfX/rUqR290rJ0Q
 tjO/ohJlJqXXYccMu47wpN+9O0jbg7gIRuQRT1IfGii2nQzR7xmQG8xe+LxD6Ps7hOhxD26FMey
 yoLScGG2aJ+UEDnRjzWPCoaY/8WtbPc70QgbXAkmhQSoOgPN2MyBTIfBPHABLnv6TQV8cbrIBZI
 alw7EV3j1HZnWh+I6GBJV1X5FhrYXKW1B4mkWam476S6+DvsxQsx3BgoRib73jsy2Mc65p5cRw/
 nVfAVSH1bhgM3s+DY3fWW7I1Q+V9X6SBGqTGguvT5i8kOHuAx5LH+gqAipI2eq8bb7SOv0VcZsw
 Nt2IDkF6LQBbmoY93nn/o9zc6As7YGX23SASh6mlcvjcUa0WdndKWpXDiFilTWMwn/4QCe3pHLT
 lyrPQfYgqffHQ8sjJ9DTCU88Hc89W/DnDEv/1ZyJbLYTVXRPntd85uoMOKUg4wIBJwPrzSjp47K
 z9GgfIFpyA4SulWp/oA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7fb88 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=e1BaVoEGz4s6-YW_u0UA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: -WM3Pxdm1O7duWyp0AGeSQNxQ8ybPTrt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5OCBTYWx0ZWRfXxi+6jmtmALXB
 SM46qH5P3RiYlRgPBhqCjcOJIEXyr64UexAT/XPOKOELNpEy0ZAHSFPftNQccYF8cz5yQd5m1rE
 VBpZxk4/Bv7Aovwme6hh7XIxXFLqeW8=
X-Proofpoint-GUID: -WM3Pxdm1O7duWyp0AGeSQNxQ8ybPTrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140198

On 9/11/26 6:47 PM, Pradeep P V K wrote:
> Add the init sequence tables and config for the UFS QMP phy found in
> the Glymur SoC.
> 
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

GPT confirms the sequences are OK and I can see that the 217 mA
load on the regulator also has some confirmation in docs. Not sure
about the other one.

in general:

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
