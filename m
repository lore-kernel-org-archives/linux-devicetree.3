Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694117;
	b=H8H418Ee/R8ZLSaKzEsbe8u791cC1VRPJsPpxUAovUzTwIc1vBXTnt1T2D0w2NtgLS/N
	 q3mgiiGVdgE0PR6BFO2rE1px5C1ndFqGtkIe5tlFRpoX9uyav8ajKVTiTq0xCApTjvPF8
	 YCc68NMjTGJU0Z7sI/dgxsyD+0NG0wEJFehz3OmnqVYiaPU3HdBIVMDKkYYUiJAutXIzN
	 gCHYdQKMGXNcJUQug4PX5VjHwhewvHtu831Jb4+J1FtEzrkBpOnaZhpmxvX9yssPzoDTO
	 MovbkkeAMoEPC2xKJc8Kj08ROimGzBLmX/63NtRxaDLnnagiuZmgf305zOnUZYfFeXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
	b=zA4WisYPAukwGZ4K9yG6+1rzQlcYc4wqmApcjaF52P2hiTyx4oUHIqsakeeYKBGoz2lz
	 HaNUdQt9c0kfMZ6IqYCwugLOZm+LJITB2lQ2Kgj/g++H8VVgZwW+UL5uX1Fh/9YgM6kV2
	 HufmN8GdzsMu6nZSOtNixnmbHHgLa83HXuFMt1FaGt6T+PjyWbQ3ImcAfgVydXY4XNIbW
	 /r5ZsSOsNwhJiOwfaEY5K8Gj0+AbzQx+cSaNZfRs+xxOzdKT9XT24qWfOqParlc1GMD6R
	 0cbKRv8XRV2daEu6VeFIUROsO3rsKBdAZFpKGPdkuPa4BVLT4jJ4JzemqyBpY4K4yvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254F3606A33C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 254F3606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jJVYUhix;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXrDHLwD
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A389anh4002666
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 08:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yLQRnh2hdGlVukDi2GeDt7GC
	NY8T/kIpvofHSqWsHiQ=; b=jJVYUhixx967j2ttO4X3I1RY5j/nnJieQ6eYyvH+
	ALvOFWymp1Kw/xWtKRwb7JxUPkj7PvOvj2qZREyi+DjSkmsJeuMQF0Dv4/F5J58f
	9T+gr26qtTUpbxxnPBVBOpSbIgbL2FYQBCNURplYoa1Vtk3ZIO/7uduE7KdpWtva
	NJNm5u0Y0OOFdd516ZiyEeZ6RYRH74wcgbvw2u0kQIxX2Ge4bI+lKZWSjgB5v9b1
	kdwGRLjPWoqFOBmhqlhVJkkxH/r0ViNspS+C1qsVtQGj+u8X9ysgPPVD3ADSFFyZ
	RMcdtCgKeDpw4tIS5ZIgq//qs321DTAk6Vilp1UZuID/JQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ejqpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:21:56 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so6099105eec.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793694116; x=1794298916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=gXrDHLwDcGr0jy2IYdwHzxamMMw05I5eI4UuC3X49SUi8JnTolpNAUfXAcoVx0Ob7O
         9qkEr8a7cCgWp9BVTOpfRrq5KcdVIRMik2zmSt6tXRS2yL2isX7euSmGWOcuGPUOPhEh
         2WzVHkZ4pYar8OJuB/medfHpHKsZj5yoKs5geLqIkfSdzmSX4YUS2AlKsyOqf3NKhcwB
         2LqYZ9OFq5tEe83a4LDRz/AJ24Tj9OtKo92TiftbCX2rVRHqL8uxN4cnW4KHJ5+DZZ15
         7rNIe9vKQaIcW4H4cCvbhxkXLlBV/eiFRHrmo5yLUyWiSr43fCPf6cnOPAW/R7shTktr
         NmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694116; x=1794298916;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLQRnh2hdGlVukDi2GeDt7GCNY8T/kIpvofHSqWsHiQ=;
        b=grIJo/1eIMsFwlRPC45MXbqLSeDgEOwtg1+1gkIXybU/uOZkY2iCpN8McaSClqLOEZ
         ZEnJUsRLBwCxGF1HXmgJ+tqbOOGiVeqKTOvzW+6axf2nBGV5DDayaE5Ji8J8Z15PhKCy
         9IwuoQTzKDshnqmuTdCEmd9tnpyXvRqCjdw5aDyp2IyjGESFC8nlC8fXXX8MHJJv7rVC
         TH7l/4p5vf18iHGBdoKuz3jSH+Inbi3TzKuHXPSgad02jGQgka9xJj8ES/wPVF/9HG5t
         M0J9bay6WYvBsyUJzjhPtJWjebbPLh7CkxOOThtZarJ/0N7pZolOqRVS84nDgA0Jk/tI
         LSYg==
X-Forwarded-Encrypted: i=1; AKwUvBxBnuVRrF/KRPsNnRuhhRXtLOJYDo/V5JN44BqKMdrp2FNy4R339kVSa1Dnk1ZAewhIHX2BQAgn/eeQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+GAt7bsFjAmxsuVKAdZbOPURFRaX/k2fNLHDsEILfW3vILKbWv
	jvZELOQRO7BMLUySfUUNZJNr4nZFcX3UWjtAqtBwT/zKrBqk/ccXESt+lkX1+ibY8qL+exj+F2g
	U9xoE+9YTHn5Zw/bAsqbv//m2Pr4ruyGM5tQepTix1nI29TGqb9xMO0rtcJETWlHvy4tlTbeTpi
	A=
X-Gm-Gg: AYBFou2kxVpuIADm3EKxROBEG5AmEQfRlHo+baAGxEZiAAUllqg8LCvHnH1373BHlei
	PUab/8hp8nR/5Hn16o2K565ttKMKNfCR0xfzQ3BB6JqXjHGPn6V3UBaxuMuGVMeMt5gAK5kPliM
	HMznj6tG1xBa2oVZi++fXOboyO8El9RsXz4v62bptNdtZPyRNd6CAs8mGQJGkg9Ljm1+awMSu/e
	yaoKy2IVqz8VgTG1xxtbinjq1teP+vkJFD7KG1NLh/fiUsTziK5vFnkRAOkfS119aUvyNy2I9zm
	GEaA/FeurqznIDbR8YoUYmxj5mdQLwgzILlck74K5/pkfqdhy/3ojjuKjIPDYKYEe9IkynUCYEP
	0t7Q/gxC15fYSo+AVXfV50HR+408PJWf3JUIFrixNEMVxEgGif3rAjYSyuaIkWencB74QuIo+nH
	j+dXi+3xNO8lyHNw==
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200307eec.29.1793694115521;
        Tue, 03 Nov 2026 00:21:55 -0800 (PST)
X-Received: by 2002:a05:693c:880d:10b0:34e:9923:e372 with SMTP id 5a478bee46e88-36a4241a810mr20200273eec.29.1793694114999;
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm39999277eec.10.2026.11.03.00.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:21:54 -0800 (PST)
Date: Tue, 3 Nov 2026 16:21:49 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
Subject: Re: [PATCH RFC] arm64: dts: qcom: nord: add ADC-TM thermistor
 channels for Nord PMICs
Message-ID: <aumZncr_X52nXO_P@QCOM-aGQu4IUr3Y>
References: <20261028150103.520428-1-shengchao.guo@oss.qualcomm.com>
 <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34479df5-3f4f-485e-8204-3744a09ce08d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX+2z+pmQ5Wk05
 /IgfCom0s5jojxxe6NvwdCHS79Qi4bpo183DxbrnLq506JIt3JsuAUdbkTtZPl0hjVbBEcDoSKi
 +NziRr0pIFdz5aZNSg14M01OtfImfPR9/xs89qojqWCJtnSrCVZjscl2ixro6nDEQCcBQEZg2AJ
 tXoj2ZddvXM9M2MBtL8ddX/xWTaKU9cEcWUz/x9bXJCrTpNj+Rr23weE4C1Dx1Z4Z+NIxWD67DR
 putoVN4J0hGtaw8U5sLhVWTJPVTgYwLUI10/KkE6AsFmKc14J55Gwbk5Ay/DT6BmTf/07O+9NdR
 mPS6lvDSpVGNH37yPp5uG8ZvLhHOZ8CAG4+jLyp5snNG82E3+dfwUaDcrx5bYFqC+ntiukED0Oc
 8nx7rS8lIFEdC7/CCRjdtuE0sp+CweIaOBuI5P6FY5B4fMXMepCU2G2i9rSgn647MvXwRS0XKph
 N13ItkZ3NsmZl0xF1Sw==
X-Proofpoint-ORIG-GUID: HyD6Wf-WGV8qPRyft-GbNROtP1f-61oO
X-Proofpoint-GUID: HyD6Wf-WGV8qPRyft-GbNROtP1f-61oO
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae999a4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JDAaRAOIzmlwRyo0OuIA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzMyBTYWx0ZWRfX0X7Q14OdB+zu
 rlc4/9Wb3wanPTxNxj3ZhGLd4D8QEoXfjYPQvWg1BBaBnRQfMzo4hGsrrJKe6kEupW89rFcE1A6
 gm5Q1FsVVrX6mWMa2hDEE1qgcPhIJv0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030033

On Mon, Nov 02, 2026 at 12:54:37PM +0100, Konrad Dybcio wrote:
> On 10/28/26 4:01 PM, Shawn Guo wrote:
> > From: Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>
> > 
> > PMAU0102 (Kai_MV) and PMM8650AU's Kobra_MM ADC5 Gen3 controllers only
> > expose REF_GND/1P25VREF/DIE_TEMP calibration channels; none of their
> > AMUX thermistor pins are wired up, so none of the board thermistor
> > rails feed the thermal framework.
> > 
> > Only 3 AMUX pins are actually wired to thermistors on Nord, all on
> > Kai and none on Kobra: Kai instance E's AMUX1 (SDRAM3 THERM) and Kai
> > instance I's AMUX1/AMUX2 (SDRAM1 THERM, UFS THERM). Kai's other AMUX
> > pins are either DO_NOT_USE or wired to voltage-rail monitors, not
> > thermistors, so add only these 3 channels.
> 
> These thermistors seem to concern board-side thermistors, not
> channels coming straight from the PMIC, so these additional
> thermistors belong in the board DT

Indeed! The AMUX wiring is board specific. I will send v2 to keep only
#thermal-sensor-cells in pmau0102-nord.dtsi (for all Kai ADC instances,
as it is a PMIC capability), and move the thermistor channels and thermal
zones into the board DTS.

Thanks for the review, Konrad!

Shawn
