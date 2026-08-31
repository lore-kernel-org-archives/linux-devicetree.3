Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0207547013F
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190486; cv=none; b=qtVmwVptYoRIPno8TPURQyzqpuYJngaUnu02DMe7CraOenDtjYwkVa9xlWuOJH+WerjAs6CMV4aBhWEOchLsF4ndP7zldmupeL5CW/4tqL3h0sUTSSTWzyzeynVa1CxSVhXeSMLaimcOtis+p0C4884BWdOg64mwGTIt8j5SmRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190486; c=relaxed/simple;
	bh=Qmh+UnNmb+EVKSqLQMoIh3CjgUp9HJ1YRoQvtfBRgso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgQC5R4OV/eUM2xo1we1RT029ft4vyXlS67lVHqfyNdw6e3e/336hUlbZTi2v48OMrM4O6MrtrV7HjpLlT0x+dYPkwtxxNrI1FkMkSkOf63n3FAYkOIpp9BhtBbnEHwgVm6xQnfVCrUV6qWNzD42swSmQYfrc4vpMVEx1SDRFck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RGyu5oqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eft1EbTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RGyu5oqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eft1EbTs"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETaZ7121886
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cvvook4xHY+Y9bKvbkn4Xe/1
	Y09WAzUHTEFJFcbQJHw=; b=RGyu5oqecdDmcQQeauGOScLrzwy7NZVfKCyawifY
	e6svPzdyVS/X4BoTPDRvXoGOxnV9q3nVUs9qwhynUuBI9KVs7qq4G03Lki0rAWsp
	Q598+b0LKFH5kvVHA/VBPqGBE6RjP2+X9xeOd4BcsBRFvUYzvdRZ/z562HyiT1d3
	Dngxj0SyiFO6gOn3JrFH8WQTyihHs7CdhAlpIyASOzOagItSOC2kYscJIeFb3gZb
	MNVW46ne1nj4hDUhoBKgBSXJnriBz+pZnFAsCe/J+VodVRJJUiPGOBVF5hZkqh6I
	W4ZXliMnvmkU2j6Oi34ChtOZIvgYJ8BW8+aY7muY52zwlg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd4pma6nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:34:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e38fbc5so526869585a.2
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 08:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788190483; x=1788795283; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cvvook4xHY+Y9bKvbkn4Xe/1Y09WAzUHTEFJFcbQJHw=;
        b=eft1EbTsgOBA7u4HIs4Uf6hGuBXf0y0h8tRjzPxFcMDvXbuNBoUszpFE1UioLxDBAa
         BGGX/oFJZrUpgZ0t/xqsf1li1fy20VJENB3AEKCj8lAR/jt1JSkc4QDUWiOcky5eWEGH
         ghknLdjc+9d/jr7WDNmPHr/n7ND6udy3iGLTEclnQ9QlQ22T5vI+s+yvZbBZj1oON4Ys
         1DxhsAnpWMoyOqOSVuHX0T9lf6Lomgnu88UsTDOHJvsz5rsV+ZR2UWupKBq5ufepovtA
         h1hg6oOrirkfJib0AcOGRKUP3T3ZAS22GFq3if5b+lNQT8tvSp7vav2l4ZDb0BJkbxNz
         EZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190483; x=1788795283;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cvvook4xHY+Y9bKvbkn4Xe/1Y09WAzUHTEFJFcbQJHw=;
        b=kDsp7A8ejBSeTafxsCYJ5jvAch/Z/kpovLGzToZLR90bbQzFFTKm44Pt5hdP/bh3oC
         t4NWxk9J7qu139xWCSLaLCa3fTisMD6HGJ1L1L3f2TIHmiQl5Y2jAWB+UIVmC8JxVgyF
         1HF2/tAu2Ke3SG8fUC7xXgtT5KvLtPm3cvg1abo1mJjxw7lyKgkgdexv3YiwR/r04lW2
         7WxZj+e/e1EVK7z7zgxMmwZ5y4kwpkMuoq1x7lvfD6TSxwmwtpajxA3Zyhx6QlJQw16Z
         /5D7xnc/j4fIgIp6ChCFELYgemwcg4ODGKjsDDvtLbz7N0ZBfpRwG1soGdg3UfKae2Lp
         J7OA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0H1fKrAsqLbzlE9X0dnJHqyc6wKNpDHFOrTXGbua0V3fYocoiWTbM5G1ly3CoLi6pZUoeB8yQCJHs@vger.kernel.org
X-Gm-Message-State: AFuF++kZulLj1IKyjTT1ME4sOgxHJts5bc9sL8XJFrFDk+dsmKsNFFyb
	50Vba5iZ7hm80oBViCUPN1IT6XwlpZ9chRfr+jAZUbdNU3LZBE6ppnJPehIZ2FJ3aydavsrieWk
	27qA+bjNEJQxDtorPNwFr6ST/Kl9Nr4oRxKETC6j/0j+jCtez2J6141LU4L6ggA8Y
X-Gm-Gg: AR+sD12nRClfJxQp4HxtUo0ovUEf4cCQhCGAPqnRRx9Z8/tN6LFAg8SoQo8Q5gdMQ4g
	OuKSIgycLt+37/HYiH2bHb8JYkYLb9whZDY9E9cQmeK+0z6ksP2oShRaUL1lEGaOae2l3t9bks7
	t/Mlc3En2HP1rr5g2E1cI/N0IDCQVAHlKAJG3Qv8H8vCLgRZUS8W720fePuJXWW2q94MAwRTsA/
	iS95fnZ9qTPGPaZfhHgh7dJgTZdhZFJf6ze1QG7qgjlXQLEqqSwwkTZ900QCdwq5sMWHl/cPpKh
	MmvQ0jSC97ozatiCzrJfjydqnV+nPb5IPAsc3yk16XqzC1UgOp9KPZXmJmEBd61nFHaoDCy8l2U
	Mcly3m7F5VdBp
X-Received: by 2002:a05:620a:4151:b0:915:9e84:85d1 with SMTP id af79cd13be357-939480b1091mr258132585a.23.1788190483016;
        Mon, 31 Aug 2026 08:34:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4151:b0:915:9e84:85d1 with SMTP id af79cd13be357-939480b1091mr258124485a.23.1788190482441;
        Mon, 31 Aug 2026 08:34:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb33d58sm20507684f8f.35.2026.08.31.08.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:34:41 -0700 (PDT)
Date: Mon, 31 Aug 2026 18:34:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <cudykz475n7bsxmgtcwmgsyc6dowejbp4a6iufycpc7kwxl4af@yur7ciz6aqvb>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
 <apWYHB50MPvQFX-h@baldur>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apWYHB50MPvQFX-h@baldur>
X-Proofpoint-ORIG-GUID: LqCbDxgO7WMCEOK3JGl0QCZAihcWPR5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzMyBTYWx0ZWRfX7I8shid1D4C8
 /kpIJKYFSbHNAoAdm5pGu7I+0MvaUNw5oAC2o85xLITeuf1YgVg31dBZnHnm669oMINs7516SjE
 yGFEq/dG9Tv6pV0Dqw31zAjfNbJv9yETK/kuvrpm8lwOE1iePnQsA5IJwN2pn9XS/7/rCD94kLf
 W3a4DsDoc5LTXkOtOHty1WFl0rgraIk721xZYiO3ZPWBoC7RzfMirl8RzWYi/WkoKp+eAjd1lSr
 bWzkWmoJl5PsFQUV14x7qfbqMsRRLxspilCYMdkiXzPhH/HOSU93xpPim62kyk5ZfeIN/XDFnxT
 3/h7e3y4/TqwhbMnVsqviD+SKI5o7xHdI480cgJoEOT2NsmlR2k59B3H7XykRisBCuQwSXU9y7a
 aEOOqJu7hgbRVKOKJkEFj8FLnQgpH7jgyM0HlZekOQbZxg4mVkEEL1O1EJCVxz9sUJ3J/hIo/7E
 WjcWLxPtMxfUlkE7z6A==
X-Proofpoint-GUID: LqCbDxgO7WMCEOK3JGl0QCZAihcWPR5R
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzMyBTYWx0ZWRfX4EsKPe7rUXBY
 frPB+JSzAmFsaxz8+e8foVTvt55tauVAu+edxbgO+GTkCuwGkA2VF4sku0NrfcFQMrRhDoaXq2e
 2XXqo4hDpx9DP3ECntHu2loin2jW0d4=
X-Authority-Analysis: v=2.4 cv=GbQnWwXL c=1 sm=1 tr=0 ts=6a959f13 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=WXqEgP72AxJV8dyWe9YA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310133

On 26-08-31 10:07:31, Bjorn Andersson wrote:
> On Mon, Aug 31, 2026 at 12:54:40PM +0300, Abel Vesa wrote:
> > GPIO 65 from TLMM is used by the embedded controller as its reset line on
> > these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> > 
> > I was only able to confirm that this GPIO is actually connected to the
> > EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> > recurring them shared between all Hamoa based devices, so I reserved it
> > on all.
> 
> Such leaps of faith comes down to risk vs reward; the risk seems
> reasonable, but your commit message just states a fact not a problem -
> so there's no documented reward...

So I actually considered adding a sentence that would mention that on
some of these devices, if you play with EC reset gpio, you might have to
disassemble the device and unplug the battery, in order to be able to
use it again. But I'm not sure that is applicable to all devices.
All I know, from someone else's experience, is that we should not be
controlling that from linux. Therefore, the commit message did not
make any assumptions about what the "reward" is.

However, I can add such a line if you still think it is worth it.
